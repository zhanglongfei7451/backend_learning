package main

import (
	"context"
	"errors"
	"fmt"
	"net"
	"strings"
	"time"

	"github.com/miekg/dns"
)

const (
	dnsTimeout time.Duration = 3 * time.Second
)

// Dig dig
type Dig struct {
	LocalAddr        string
	RemoteAddr       string
	BackupRemoteAddr string
	EDNSSubnet       net.IP
	DialTimeout      time.Duration
	WriteTimeout     time.Duration
	ReadTimeout      time.Duration
	Protocol         string
	Retry            int
	Fallback         bool //if Truncated == true; udp -> tcp
	nilRetry         int  //if Truncated == true; udp -> tcp
}

func (d *Dig) protocol() string {
	if d.Protocol != "" {
		return d.Protocol
	}
	return "udp"
}

func (d *Dig) dialTimeout() time.Duration {
	if d.DialTimeout != 0 {
		return d.DialTimeout
	}
	return dnsTimeout
}

func (d *Dig) readTimeout() time.Duration {
	if d.ReadTimeout != 0 {
		return d.ReadTimeout
	}
	return dnsTimeout
}

func (d *Dig) writeTimeout() time.Duration {
	if d.WriteTimeout != 0 {
		return d.WriteTimeout
	}
	return dnsTimeout
}

func (d *Dig) retry() int {
	if d.Retry > 0 {
		return d.Retry
	}
	return 1
}

func (d *Dig) remoteAddr() (string, error) {
	_, _, err := net.SplitHostPort(d.RemoteAddr)
	if err != nil {
		if ns, e := nameserver(); e == nil {
			d.RemoteAddr = net.JoinHostPort(ns, "53")
		} else {
			return d.RemoteAddr, fmt.Errorf("bad remoteaddr %v ,forget SetDNS ? : %s", d.RemoteAddr, err)
		}
	}
	return d.RemoteAddr, nil
}

func (d *Dig) conn(ctx context.Context) (net.Conn, error) {
	remoteaddr, err := d.remoteAddr()
	if err != nil {
		return nil, err
	}
	di := net.Dialer{Timeout: d.dialTimeout()}
	if d.LocalAddr != "" {
		di.LocalAddr, err = resolveLocalAddr(d.protocol(), d.LocalAddr)
	}
	return di.DialContext(ctx, d.protocol(), remoteaddr)
}

func resolveLocalAddr(network string, laddr string) (net.Addr, error) {
	network = strings.ToLower(network)
	laddr += ":0"
	switch network {
	case "udp":
		return net.ResolveUDPAddr(network, laddr)
	case "tcp":
		return net.ResolveTCPAddr(network, laddr)
	}
	return nil, errors.New("unknown network:" + network)
}

func newMsg(Type uint16, domain string) *dns.Msg {
	domain = dns.Fqdn(domain)
	msg := new(dns.Msg)
	msg.Id = dns.Id()
	msg.RecursionDesired = true
	msg.Question = make([]dns.Question, 1)
	msg.Question[0] = dns.Question{
		Name:   domain,
		Qtype:  Type,
		Qclass: dns.ClassINET,
	}
	return msg
}

// Exchange 发送msg 接收响应
func (d *Dig) Exchange(m *dns.Msg) (*dns.Msg, error) {
	var msg *dns.Msg
	var err error
	for i := 0; i < d.retry(); i++ {
		msg, err = d.exchange(context.TODO(), m)
		if err == nil {
			return msg, err
		}
	}
	return msg, err
}

func (d *Dig) exchange(ctx context.Context, m *dns.Msg) (*dns.Msg, error) {
	var err error
	c := new(dns.Conn)
	c.Conn, err = d.conn(ctx)
	if err != nil {
		return nil, err
	}
	defer c.Close()
	c.SetWriteDeadline(time.Now().Add(d.writeTimeout()))
	d.edns0clientsubnet(m)
	err = c.WriteMsg(m)
	if err != nil {
		return nil, err
	}
	c.SetReadDeadline(time.Now().Add(d.readTimeout()))
	res, err := c.ReadMsg()
	if err != nil {
		return nil, err
	}
	if res.Id != m.Id {
		return res, dns.ErrId
	}
	if d.protocol() == "udp" && res.Truncated {
		dig := *d
		dig.Protocol = "tcp"
		res, err := dig.exchange(ctx, m)
		if err == nil {
			return res, nil
		}
	}
	return res, nil
}

// SetDNS 设置查询的dns server
// Deprecated: use At
func (d *Dig) SetDNS(host string) error {
	var err error
	d.RemoteAddr, err = d.lookupdns(host)
	return err
}

func (d *Dig) lookupdns(host string) (string, error) {
	var ip string
	port := "53"
	switch strings.Count(host, ":") {
	case 0: //ipv4 or domain
		ip = host
	case 1: //ipv4 or domain
		var err error
		ip, port, err = net.SplitHostPort(host)
		if err != nil {
			return "", err
		}
	default: //ipv6
		if net.ParseIP(host).To16() != nil {
			ip = host
		} else {
			ip = host[:strings.LastIndex(host, ":")]
			port = host[strings.LastIndex(host, ":")+1:]
		}
	}
	ips, err := net.LookupIP(ip)
	if err != nil {
		return "", err
	}
	for _, addr := range ips {
		return fmt.Sprintf("[%s]:%v", addr, port), nil
	}
	return "", errors.New("no such host")

}

// GetMsg 返回msg响应体
func (d *Dig) GetMsg(Type uint16, domain string) (*dns.Msg, error) {
	m := newMsg(Type, domain)
	return d.Exchange(m)
}

func (d *Dig) edns0clientsubnet(m *dns.Msg) {
	//if d.EDNSSubnet == nil {
	//	return
	//}
	//var fCode uint16
	//var netMask uint8
	//edsStr := fmt.Sprintf("%s", d.EDNSSubnet)
	//if strings.Contains(edsStr, ":") {
	//	fCode = 2
	//	netMask = 64
	//} else {
	//	fCode = 1
	//	netMask = 32
	//}
	//
	//e := &dns.EDNS0_SUBNET{
	//	Code:          dns.EDNS0SUBNET,
	//	Family:        fCode,
	//	SourceNetmask: netMask,
	//	Address:       d.EDNSSubnet,
	//}
	o := new(dns.OPT)
	o.Hdr.Name = "."
	o.SetUDPSize(512)
	o.Hdr.Rrtype = dns.TypeOPT
	//o.Option = append(o.Option, e)
	m.Extra = append(m.Extra, o)
}

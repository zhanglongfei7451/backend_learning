package main

import (
	"fmt"
	"github.com/miekg/dns"
)

func main() {

	var dig Dig
	if err := dig.SetDNS("127.0.0.1"); err != nil {
		fmt.Println(err)
		return
	}
	a, err := dig.GetMsg(dns.TypeA, "example.org")

	if err != nil {
		fmt.Println(err)
		return
	}

	fmt.Println(a.Len())
	fmt.Println(a.Compress)

}

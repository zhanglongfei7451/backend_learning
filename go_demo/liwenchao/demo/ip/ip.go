package main

import (
	"bytes"
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"strconv"
	"strings"
)

type Monitor struct {
	MonitorType  int           `json:"monitorType"`
	Port         int           `json:"port"`
	HttpMethod   int           `json:"httpMethod"`
	MonitorNodes []interface{} `json:"monitorNodes"`
	Availability interface{}   `json:"availability"`
}

type Warning struct {
	WarnMethod   interface{} `json:"warnMethod"`
	WarnInterval interface{} `json:"warnInterval"`
	WarnEmail    interface{} `json:"warnEmail"`
	WarnPhone    interface{} `json:"warnPhone"`
}

type PolicyResource struct {
	PartType  int    `json:"partType"`
	Type      int    `json:"type"`
	Value     string `json:"value"`
	LoadRatio int    `json:"loadRatio"`
	Status    int    `json:"status"`
	Remark    string `json:"remark"`
}

type SendData struct {
	PolicyDesc     string           `json:"policyDesc"`
	PolicyType     interface{}      `json:"policyType"`
	DomainID       interface{}      `json:"domainId"`
	Rate           interface{}      `json:"rate"`
	Monitor        Monitor          `json:"monitor"`
	Warning        Warning          `json:"warning"`
	PolicyResource []PolicyResource `json:"policyResource"`
}

func fetchData(dateReq map[string]interface{}, ipList []string) SendData {
	valueList := []PolicyResource{}
	for _, item := range ipList {
		pr := PolicyResource{
			PartType:  0,
			Type:      validateIP(item),
			Value:     item,
			LoadRatio: 10,
			Status:    0,
			Remark:    "",
		}
		valueList = append(valueList, pr)
	}

	return SendData{
		PolicyDesc:     dateReq["policyDesc"].(string),
		PolicyType:     dateReq["policyType"],
		DomainID:       dateReq["domainId"],
		Rate:           dateReq["rate"],
		Monitor:        createMonitor(dateReq),
		Warning:        createWarning(dateReq),
		PolicyResource: valueList,
	}
}

func createMonitor(dateReq map[string]interface{}) Monitor {
	return Monitor{
		MonitorType:  getIntValue(dateReq, "monitorType", 3),
		Port:         getIntValue(dateReq, "port", 80),
		HttpMethod:   getIntValue(dateReq, "httpMethod", 0),
		MonitorNodes: dateReq["monitorTypeVOList"].([]interface{}),
		Availability: dateReq["availability"],
	}
}

func createWarning(dateReq map[string]interface{}) Warning {
	return Warning{
		WarnMethod:   dateReq["warnMethod"],
		WarnInterval: dateReq["warnInterval"],
		WarnEmail:    dateReq["warnEmail"],
		WarnPhone:    dateReq["warnPhone"],
	}
}

func getIntValue(data map[string]interface{}, key string, defaultValue int) int {
	if value, ok := data[key]; ok {
		return int(value.(float64))
	}
	return defaultValue
}

func bulkModify(sendData SendData, userId string, policyId string) {
	dataFormat, err := json.Marshal(sendData)
	if err != nil {
		log.Fatalf("Error marshalling data: %v", err)
	}

	client := &http.Client{}
	req, err := http.NewRequest("PUT", fmt.Sprintf("http://10.176.44.64:31996/gtm/cm/policy/%s", policyId), bytes.NewBuffer(dataFormat))
	if err != nil {
		log.Fatalf("Error creating request: %v", err)
	}

	req.Header.Set("user_id", userId)
	req.Header.Set("Content-Type", "application/json")
	req.Header.Set("Host", "bcgtm.io")

	resp, err := client.Do(req)
	if err != nil {
		log.Fatalf("Error sending request: %v", err)
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		log.Fatalf("Modify data error, status_code: %d", resp.StatusCode)
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatalf("Error reading response: %v", err)
	}

	var result map[string]interface{}
	json.Unmarshal(body, &result)

	if result["state"] == "OK" {
		log.Println("Modify policy success!")
	} else {
		log.Println("Modify policy failed!")
	}

	fmt.Println("Response:", result)
}

func bulkQuery(userId string, policyId string) map[string]interface{} {
	client := &http.Client{}
	req, err := http.NewRequest("POST", "http://10.176.44.64:31996/gtm/cm/policy/queries?currentPage=&pageSize=", strings.NewReader(fmt.Sprintf(`{"policyId":%s}`, policyId)))
	if err != nil {
		log.Fatalf("Error creating request: %v", err)
	}

	req.Header.Set("user_id", userId)
	req.Header.Set("Content-Type", "application/json")
	req.Header.Set("Host", "bcgtm.io")

	resp, err := client.Do(req)
	if err != nil {
		log.Fatalf("Error sending request: %v", err)
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		log.Fatalf("Report data error, status_code: %d", resp.StatusCode)
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatalf("Error reading response: %v", err)
	}

	var result map[string]interface{}
	json.Unmarshal(body, &result)

	return result["body"].(map[string]interface{})["records"].([]interface{})[0].(map[string]interface{})
}

func validateIP(ip string) int {
	parts := strings.Split(ip, ".")
	if len(parts) == 4 {
		for _, x := range parts {
			num, err := strconv.Atoi(x)
			if err != nil || num < 0 || num > 255 {
				return 1
			}
		}
		return 0
	}
	return 1
}

func main() {
	log.SetFlags(log.LstdFlags | log.Lshortfile)

	var ipListStr string
	var userId string
	var policyId string

	flag.StringVar(&ipListStr, "ip_list", "", "Comma-separated list of IPs")
	flag.StringVar(&userId, "user_id", "CIDC-U-e63d2a7766aa4bd1a11319ceac87b210", "User ID")
	flag.StringVar(&policyId, "policy_id", "", "Policy ID")
	flag.Parse()

	if ipListStr == "" || policyId == "" {
		flag.Usage()
		os.Exit(1)
	}

	ipList := strings.Split(ipListStr, ",")
	fmt.Printf("输入的IP：%v, userId: %s, policyId: %s\n", ipList, userId, policyId)

	// 查询策略
	res := bulkQuery(userId, policyId)

	// 获取发送的数据
	data := fetchData(res, ipList)

	// 发送修改策略的请求
	bulkModify(data, userId, policyId)
}

//package ip
//
//import (
//	"encoding/binary"
//	"encoding/hex"
//	"errors"
//	"net"
//)
//
//func Demo() {
//	edns_subnet := &EDNS0_SUBNET{
//		Code:          8,
//		Address:       net.ParseIP("101.127.112.10"),
//		Family:        1,
//		SourceNetmask: 32,
//		SourceScope:   0,
//	}
//	pack, err := edns_subnet.pack()
//	if err != nil {
//		return
//	}
//	hexStr := hex.EncodeToString(pack)
//	println(hexStr)
//}
//
//type EDNS0_SUBNET struct {
//	Code          uint16 // Always EDNS0SUBNET
//	Family        uint16 // 1 for IP, 2 for IP6
//	SourceNetmask uint8
//	SourceScope   uint8
//	Address       net.IP
//}
//
//// Option implements the EDNS0 interface.
//func (e *EDNS0_SUBNET) Option() uint16 { return 8 }
//
//func (e *EDNS0_SUBNET) pack() ([]byte, error) {
//	b := make([]byte, 4)
//	binary.BigEndian.PutUint16(b[0:], e.Family)
//	b[2] = e.SourceNetmask
//	b[3] = e.SourceScope
//	switch e.Family {
//	case 0:
//		// "dig" sets AddressFamily to 0 if SourceNetmask is also 0
//		// We might don't need to complain either
//		if e.SourceNetmask != 0 {
//			return nil, errors.New("dns: bad address family")
//		}
//	case 1:
//		if e.SourceNetmask > net.IPv4len*8 {
//			return nil, errors.New("dns: bad netmask")
//		}
//		if len(e.Address.To4()) != net.IPv4len {
//			return nil, errors.New("dns: bad address")
//		}
//		ip := e.Address.To4().Mask(net.CIDRMask(int(e.SourceNetmask), net.IPv4len*8))
//		needLength := (e.SourceNetmask + 8 - 1) / 8 // division rounding up
//		b = append(b, ip[:needLength]...)
//	case 2:
//		if e.SourceNetmask > net.IPv6len*8 {
//			return nil, errors.New("dns: bad netmask")
//		}
//		if len(e.Address) != net.IPv6len {
//			return nil, errors.New("dns: bad address")
//		}
//		ip := e.Address.Mask(net.CIDRMask(int(e.SourceNetmask), net.IPv6len*8))
//		needLength := (e.SourceNetmask + 8 - 1) / 8 // division rounding up
//		b = append(b, ip[:needLength]...)
//	default:
//		return nil, errors.New("dns: bad address family")
//	}
//	return b, nil
//}

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
	req, err := http.NewRequest("PUT", fmt.Sprintf("http://10.176.44.64:31996/policy/%s", policyId), bytes.NewBuffer(dataFormat))
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
	req, err := http.NewRequest("POST", "http://10.176.44.64:31996/policy/queries?currentPage=&pageSize=", strings.NewReader(fmt.Sprintf(`{"policyId":%s}`, policyId)))
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

//package main
//
//import "demo/ip"
//
//func main() {
//	// mypack.New()
//	// mypack.New1()
//	// mypack.New2()
//	// mypack.NewFunc()
//	// mypack.NewZhizhen()
//	// mypack.DemoArray()
//	// mypack.DemoMap()
//	// mypack.DemoSlice()
//	// mypack.DemoNil()
//	// mypack.DemoStruct()
//	// mypack.DemoGoRuntine()
//	// mypack.DemoChannel()
//	//mypack.Demo()
//	//bao.Demo()
//	//chanDemo.Demo()
//	//lock.Demo()
//	//mypack.Ipdb()
//
//	ip.Demo()
//}

//func demo() {
//
//	fmt.Println(time.Now().Hour())
//
//	str := fmt.Sprintf("(%d时%d分%d秒)", time.Now().Hour(), time.Now().Minute(), time.Now().Second())
//	err := os.MkdirAll("./csv/"+time.Now().Format("2006-01-02")+str, 0755)
//
//	if err != nil {
//		return
//	}
//
//}

//type Sayer interface {
//	say()
//}
//
//type Cat struct {
//}
//
//func (c *Cat) say() {
//	fmt.Println("zz")
//}
//
//type Dog struct {
//}
//
//func (d Dog) say() {
//	fmt.Println("zzaa")
//}
//
//func jiaohuan(s Sayer) {
//	s.say()
//}
//
//func demo() {
//	c := Cat{}
//	jiaohuan(&c)
//	d := Dog{}
//	jiaohuan(&d)
//}

//type Person struct {
//	name   string
//	dreams []string
//}
//
//func (p *Person) SetDreams(dreams []string) {
//	p.dreams = make([]string, len(dreams))
//	copy(p.dreams, dreams)
//}
//
//func demo() {
//	p1 := Person{name: "wang"}
//	data := []string{"ss", "sss", "ssss"}
//
//	p1.SetDreams(data)
//
//	data[1] = "ppppp"
//	fmt.Println(p1.dreams)
//}

//func demo() {
//	c := &class{
//		Title:    "101",
//		Students: make([]*Student, 0, 200),
//	}
//
//	for i := 0; i < 10; i++ {
//		stu := &Student{
//			Name:   fmt.Sprintf("stu%02d", i),
//			Gender: "男",
//			ID:     i,
//		}
//
//		c.Students = append(c.Students, stu)
//	}
//
//	data, err := json.Marshal(c)
//
//	if err != nil {
//		return
//	}
//	fmt.Printf("json:%s\n", data)
//
//	str := `{"Title":"101","Students":[{"ID":0,"Gender":"男","Name":"stu00"},{"ID":1,"Gender":"男","Name":"stu01"},{"ID":2,"Gender":"男","Name":"stu02"},{"ID":3,"Gender":"男","Name":"stu03"},{"ID":4,"Gender":"男","Name":"stu04"},{"ID":5,"Gender":"男","Name":"stu05"},{"ID":6,"Gender":"男","Name":"stu06"},{"ID":7,"Gender":"男","Name":"stu07"},{"ID":8,"Gender":"男","Name":"stu08"},{"ID":9,"Gender":"男","Name":"stu09"}]}`
//	c1 := &class{}
//	err = json.Unmarshal([]byte(str), c1)
//	if err != nil {
//		fmt.Println("json unmarshal failed!")
//		return
//	}
//	fmt.Printf("%#v\n", c1)
//}

//func demo() {
//	m := make(map[string]*zha)
//	stus := []zha{
//		{"zz", 100},
//		{"lu", 10},
//		{"wang", 1},
//	}
//
//	for _, value := range stus {
//		m[value.name] = &value
//	}
//
//	for k, v := range m {
//		fmt.Println(k, "=>", v.name)
//	}
//}

//func demo() {
//	scoreMap := make([]map[string]int, 3)
//	scoreMap[0] = make(map[string]int, 10)
//	scoreMap[1] = make(map[string]int, 2)
//
//	scoreMap[0]["name"] = 77
//	scoreMap[0]["liu"] = 88
//	fmt.Printf("%d\n", scoreMap)
//	for index, value := range scoreMap {
//		fmt.Printf("index:%d value:%v\n", index, value)
//	}
//}

//type CustomLine struct {
//	Id   string
//	Name string
//}
//
//func demo() {
//	v1 := CustomLine{Id: "1", Name: "zhang"}
//	v2 := CustomLine{Id: "2", Name: "liu"}
//	vvvvv := [2]CustomLine{v1, v2}
//
//	mappp := make(map[string]CustomLine, 0)
//	for _, value := range vvvvv {
//		mappp[value.Id] = value
//	}
//
//	clients := []*CustomLine{}
//	for _, v := range mappp {
//
//		clients = append(clients, &v)
//	}
//
//	return
//}

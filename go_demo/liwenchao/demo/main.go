package main

import (
	"fmt"
	"os"
	"time"
)

func main() {
	// mypack.New()
	// mypack.New1()
	// mypack.New2()
	// mypack.NewFunc()
	// mypack.NewZhizhen()
	// mypack.DemoArray()
	// mypack.DemoMap()
	// mypack.DemoSlice()
	// mypack.DemoNil()
	// mypack.DemoStruct()
	// mypack.DemoGoRuntine()
	// mypack.DemoChannel()
	//mypack.Demo()
	//bao.Demo()
	//chanDemo.Demo()
	//lock.Demo()
	demo()
}

func demo() {

	fmt.Println(time.Now().Hour())

	str := fmt.Sprintf("(%d时%d分%d秒)", time.Now().Hour(), time.Now().Minute(), time.Now().Second())
	err := os.MkdirAll("./csv/"+time.Now().Format("2006-01-02")+str, 0755)

	if err != nil {
		return
	}

}

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

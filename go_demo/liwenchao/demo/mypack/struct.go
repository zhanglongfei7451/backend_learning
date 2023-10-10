package mypack

import(
	"fmt"
)

type person struct {
	name string
	city string
	age  int8
}

func DemoStruct()  {
	// type关键字自定义类型
	// 通过struct来实现面向对象，字段名必须唯一
	// 必须实例化后才能使用结构体的字段
	
	var p1 person
	p1.name = "沙河娜扎"
	p1.city = "北京"
	p1.age = 18
	fmt.Printf("p1=%v\n", p1)  //p1={沙河娜扎 北京 18}
	fmt.Printf("p1=%#v\n", p1) //p1=main.person{name:"沙河娜扎", city:"北京", age:18}
}

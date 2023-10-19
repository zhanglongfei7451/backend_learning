package mypack

import (
	"fmt"
)

type person struct {
	name string
	city string
	age  int8
}

func newPerson(name, city string, age int8) *person {
	return &person{
		name: name,
		city: city,
		age:  age,
	}
}

func (p person) Dream(newAge int8) {
	p.age = newAge
	fmt.Println(p.age)
}

func (p *person) setAge(newAge int8) {
	p.age = newAge
	fmt.Println(p.age)
}

func DemoStruct() {
	// type关键字自定义类型
	// 通过struct来实现面向对象，字段名必须唯一
	// 必须实例化后才能使用结构体的字段

	var p1 person
	p1.name = "沙河娜扎"
	p1.city = "北京"
	p1.age = 18
	fmt.Printf("p1=%v\n", p1)  //p1={沙河娜扎 北京 18}
	fmt.Printf("p1=%#v\n", p1) //p1=main.person{name:"沙河娜扎", city:"北京", age:18}

	// 匿名结构体
	var user struct {
		Name string
		Age  int
	}
	user.Name = "zjkak"
	user.Age = 18
	fmt.Println(user)

	// 使用new关键字对结构体实例化
	var p2 = new(person)
	p2.age = 19 // 相当于(*p2).age = 19 ,go语言的语法糖
	fmt.Printf("%T\n", p2)
	fmt.Println(*p2) // {  0}

	// 未初始化的结构体，成员变量都是对应其类型的零值

	// 使用键值对初始化
	p3 := person{
		name: "小王子",
		city: "北京",
		age:  18,
	}

	fmt.Println(p3)
	fmt.Printf("%#v\n", p3) // mypack.person{name:"小王子", city:"北京", age:18}

	// 结构体内存布局,占用一块连续的内存

	type test struct {
		a int8
		b int8
		c int8
		d int8
	}
	n := test{
		1, 2, 2, 4,
	}

	fmt.Printf("n.a %p\n", &n.a) // n.a 0xc00000a120
	fmt.Printf("n.b %p\n", &n.b) // n.b 0xc00000a121
	fmt.Printf("n.c %p\n", &n.c) // n.c 0xc00000a122
	fmt.Printf("n.d %p\n", &n.d) // n.d 0xc00000a123

	m := test{
		1, 2, 2, 4,
	}
	fmt.Printf("n.a %p\n", &m.a) // n.a 0xc00000a124
	fmt.Printf("n.b %p\n", &m.b) // n.b 0xc00000a125
	fmt.Printf("n.c %p\n", &m.c) // n.c 0xc00000a126
	fmt.Printf("n.d %p\n", &m.d) // n.d 0xc00000a127

	// 构造函数

	p4 := newPerson("zhan", "sha", 98)
	fmt.Printf("%#v\n", p4) // &mypack.person{name:"zhan", city:"sha", age:98}

	// 方法与函数的区别是，函数不属于任何类型，方法属于特定的类型。
	p4.Dream(20)        // 20
	fmt.Println(p4.age) // 98 为什么还是98
	// 当方法作用于值类型接收者时，Go语言会在代码运行时将接收者的值复制一份。
	// 在值类型接收者的方法中可以获取接收者的成员值，但修改操作只是针对副本，无法修改接收者变量本身
	// 什么时候应该使用指针类型接收者
	// 需要修改接收者中的值
	// 接收者是拷贝代价比较大的大对象
	// 保证一致性，如果有某个方法使用了指针接收者，那么其他的方法也应该使用指针接收者。
	p4.setAge(18) // 18
}

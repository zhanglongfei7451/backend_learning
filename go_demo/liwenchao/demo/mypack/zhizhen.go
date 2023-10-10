package mypack

import (
	"fmt"
)

// go语言的指针不能偏移和运算，是安全指针
// 任何数据载入内存时，在内存中都有它们的地址，为了保存该地址，需要指针变量
// 通过该数据的变量和指针变量都可以找到该数据

// 只需要记住两个符号。&--取地址，*--根据地址取值

// Go语言中的值类型（int、float、bool、string、array、struct）都有对应的指针类型，
// 如：*int、*int64、*string等

// 对变量进行取地址（&）操作，可以获得这个变量的指针变量。
// 指针变量的值是指针地址。
// 对指针变量进行取值（*）操作，可以获得指针变量指向的原变量的值。

func modify1(y int) {
	z := 10 + y
	fmt.Println(z)
}

func modify2(x *int) {
	*x = 100
}

func NewZhizhen() {
	a := 10
	b := &a
	fmt.Printf("type of b:%T\n", b)
	fmt.Printf("value of b:%v\n", b)
	c := *b
	fmt.Printf("type of c:%T\n", c)
	fmt.Printf("type of c:%v\n", c)

	modify1(a)
	fmt.Println(a)
	modify2(&a)
	fmt.Println(a)

	// 使用new函数得到的是一个类型的指针，并且该指针对应的值为该类型的零值
	var aaa *int = new(int)
	var bbb *int = new(int)
	fmt.Println(*aaa)     // 0
	fmt.Println(*bbb)     // 0
	fmt.Printf("%T \n", aaa) // *int
	fmt.Println(aaa)
	fmt.Println(bbb)
	fmt.Println(&aaa)
	fmt.Println(&bbb)

	// make也是用于内存分配的，区别于new，它只用于slice、map以及channel的内存创建，
	// 而且它返回的类型就是这三个类型本身，而不是他们的指针类型，
	// 因为这三种类型就是引用类型，所以就没有必要返回他们的指针了。
	// make函数是无可替代的，我们在使用slice、map以及channel的时候，
	// 都需要使用make进行初始化，然后才可以对它们进行操作
	
	// var b map[string]int只是声明变量b是一个map类型的变量，需要像下面的示例代码一样
	// 使用make函数进行初始化操作之后，才能对其进行键值对赋值：
	// var b map[string]int
	// b = make(map[string]int, 10)
	// b["沙河娜扎"] = 100
	// fmt.Println(b)

	// make只用于slice、map以及channel的初始化，返回的还是这三个引用类型本身
	// 而new用于类型的内存分配，并且内存对应的值为类型零值，返回的是指向类型的指针
}

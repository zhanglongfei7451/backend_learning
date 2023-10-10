package mypack

import(
	"fmt"
)

func DemoNil()  {
	// nil为初始值，零值，无的意思
	// 布尔、字符串、数值的零值分别为false/""/0
	// 指针、切片、映射、通道、函数和接口的零值则是nil
	type Person struct{
		Age int
		Name string
		Friends []string
	}

	var p Person
	fmt.Println(p) // {0 "" []}
}
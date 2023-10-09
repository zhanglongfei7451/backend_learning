package mypack

import (
	"fmt"
)

// 布尔类型变量的默认值为false。
// Go 语言中不允许将整型强制转换为布尔型.
// 布尔型无法参与数值运算，也无法与其他类型进行转换

var duohang string = `kssk
skl;k;ls
solk;l
`

func New1() {
	fmt.Println("------02.go-------")
	m := 200
	c := 0x13
	fmt.Printf("%d \n", m)
	fmt.Printf("%x", c)
	fmt.Println("str := \"c:\\code\\zhzh\njjkmkj\"")
	fmt.Println(duohang)
	// Go语言中只有强制类型转换
	s := "abcdefg张龙飞"
	for i, j := range s{
		fmt.Printf("%v(%c) ", i, j)
	}
	fmt.Println("")
	runes1 := []rune(s)
	runes1[7] = '刘'
	fmt.Println(string(runes1))
}

package mypack

import (
	"fmt"
)

// 全局变量m
var m = 100

var (
	a string
	b float32
	c bool
)

func foo() (int, string) {
	return 10, "zhan"
}

// 函数外的每个语句都必须以关键字开始（var、const、func等）
// :=不能使用在函数外。
// _多用于占位，表示忽略值。

const zh = 999

func New() {
	foo()
	x, _ := foo()
	n := 10 // 函数内部才可以使用
	fmt.Println(m, n, a, b, c, x, zh)
	z := 20
	fmt.Println(z)
}

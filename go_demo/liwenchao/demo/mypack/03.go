package mypack

import (
	"fmt"
)

func New2() {
	score := 200
	if score >= 100 {
		fmt.Println("A")
	} else if score >= 200 {
		fmt.Println("B")
	} else {
		fmt.Println("C")
	}
	// for循环可以通过break、goto、return、panic语句强制退出循环。

	// for range(键值循环)
	// 数组、切片、字符串返回索引和值。
	// map返回键和值。
	// 通道（channel）只返回通道内的值。
	s := "zhang龙飞"
	for index, value := range s {
		fmt.Println(index, string(value))
		// 0 z
		// 1 h
		// 2 a
		// 3 n
		// 4 g
		// 5 龙
		// 8 飞
	}

	var arr01 [3]int
	var arr02 = [3]int{1, 2, 3}
	var arr03 = [3]string{"北京", "上海", "nanjin"}
	// 可以让编译器根据初始值的个数自行推断数组的长度，例如：
	var arr04 = [...]int{1, 23, 23}
	fmt.Println(arr01, arr02, arr03, arr04)
	fmt.Printf("type of numArray:%T\n", arr04) //type of numArray:[3]int

	for i := 0; i < len(arr02); i++ {
		fmt.Println(arr02[i])
	}
	fmt.Println("-------------")
	main()
}

// 因为数组的长度是固定的并且数组长度属于类型的一部分，所以数组有很多的局限性
func modifyArray(x [3]string) {
	//这个函数只能接受[3]string类型，其他的都不支持。
	x[0] = "zhang"
	fmt.Println(x) // [zhang ee www]
}

func modifyArray2(x [3][2]int) {
	x[2][0] = 100
}
func main() {
	a := [3]string{"www", "ee", "www"}
	modifyArray(a) //在modify中修改的是a的副本x
	fmt.Println(a) //[www ee www]
	b := [3][2]int{
		{1, 1},
		{1, 1},
		{1, 1},
	}
	modifyArray2(b) //在modify中修改的是b的副本x
	fmt.Println(b)  //[[1 1] [1 1] [1 1]]
}

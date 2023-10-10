package mypack

import(
	"fmt"
)

func modifyArra(x [3]int) {
	x[0] = 100
}

func modifyArra2(x [3][2]int) {
	x[2][0] = 100
}

func DemoArray() {
	// 数组从声明时就确定，使用时可以修改数组成员，但是数组大小不可变化
	// 数组长度是常量，长度也是类型的一部分，一旦定义长度不可变
	var aa [3]int
	var bb = [3]int{1, 2}
	var c = [3]string{"ewww", "fdsd"}
	fmt.Println(aa, bb)
	c[2] = "22"
	fmt.Println(c[2])
	// 根据初始值的个数自行推断数组的长度
	var d = [...]int{1, 2, 3}
	fmt.Println(d)

	// 遍历数组
	// 方法1：for循环遍历
	for i := 0; i < len(c); i++ {
		fmt.Println(c[i])
	}
	// 方法2：for range遍历
	for index, value := range c {
		fmt.Println(index, value)
	}

	// 数组是值类型，赋值和传参会复制整个数组
	a := [3]int{10, 20, 30}
	modifyArra(a) //在modify中修改的是a的副本x
	fmt.Println(a) //[10 20 30]
	b := [3][2]int{
		{1, 1},
		{1, 1},
		{1, 1},
	}
	modifyArra2(b) //在modify中修改的是b的副本x
	fmt.Println(b)  //[[1 1] [1 1] [1 1]]

	// 数组支持 “==“、”!=” 操作符，因为内存总是被初始化过的。
	// [n]*T表示指针数组，*[n]T表示数组指针 。	
}
package mypack

import(
	"fmt"
)

func DemoSlice()  {
	// 切片元素类型相同，长度可变
	// 是引用类型，内部结构包括地址、长度和容量
	// 用于快速的操作一块数据集合

	// 声明切片类型
	var a []string              //声明一个字符串切片,括号里面不需要加数字
	var b = []int{}             //声明一个整型切片并初始化
	var c = []bool{false, true} //声明一个布尔切片并初始化

	fmt.Println(a)              //[]
	fmt.Println(b)              //[]
	fmt.Println(c)              //[false true]
	fmt.Println(a == nil)       //true
	fmt.Println(b == nil)       //false
	fmt.Println(c == nil)       //false


	// 切片表达式从字符串、数组、指向数组或切片的指针构造子字符串或切片。
	// 它有两种变体：一种指定low和high两个索引界限值的简单的形式，
	// 另一种是除了low和high索引界限值外还指定容量的完整的形式
	aa := [5]int{1, 2, 3, 4, 5}
	s := aa[1:3]
	s[0] = 1000
	s = append(s, 90090)
	fmt.Println(s) //[1000 3 90090]
	fmt.Println(aa) //[1 1000 3 90090 5]
	fmt.Printf("%v,%v,%v", s, len(s), cap(s)) //[1000 3 90090],3,4


	// 动态的创建一个切片
	// 上面代码中a的内部存储空间已经分配了10个，但实际上只用了2个
	// aaaa := make([]int, 2, 10)
	// fmt.Println(aaaa)      //[0 0]
	// fmt.Println(len(aaaa)) //2
	// fmt.Println(cap(aaaa)) //10
	// aaaa = append(aaaa, 23,2,2,2,2,2,2,2,2,2,2,2,2,33)
	// fmt.Println(aaaa)

	// 切片的本质就是对底层数组的封装，它包含了三个信息：底层数组的指针、切片的长度（len）和切片的容量（cap）。

	s1 := make([]int, 3) //[0 0 0]
	s2 := s1             //将s1直接赋值给s2，s1和s2共用一个底层数组
	s2[0] = 100
	fmt.Println(s1) //[100 0 0]
	fmt.Println(s2) //[100 0 0]

	for i := 0; i < len(s); i++ {
		fmt.Println(i, s[i])
	}

	for index, value := range s {
		fmt.Println(index, value)
	}

	// 每个切片会指向一个底层数组，这个数组的容量够用就添加新增元素。当底层数组不能容纳新增的元素时，
	// 切片就会自动按照一定的策略进行“扩容”，此时该切片指向的底层数组就会更换。
	// “扩容”操作往往发生在append()函数调用时，所以我们通常都需要用原变量接收append函数的返回值。
	// append()函数将元素追加到切片的最后并返回该切片。
	// 切片numSlice的容量按照1，2，4，8，16这样的规则自动进行扩容，每次扩容后都是扩容前的2倍。

	// copy 函数可以将一个切片的值复制到另一个切片中，两者的底层数组不一样
	// 从切片中删除元素
	da := []int{30, 31, 32, 33, 34, 35, 36, 37}
	// 要删除索引为2的元素
	da = append(da[:2], da[3:]...)
	fmt.Println(da) //[30 31 33 34 35 36 37]
}
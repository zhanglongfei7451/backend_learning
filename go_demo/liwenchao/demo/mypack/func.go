package mypack

import (
	"fmt"
)

// go支持函数、匿名函数和闭包
// 同一包内函数名不能重复
// 参数由参数变量和其类型组成,相邻变量类型相同可以省略类型
// 返回值由返回值变量和其类型组成,也可只写返回值类型, 多个返回值必须用()包围

// 调用函数时,如果有返回值可以不用接收


func calc(x, y int) (sum, sub int) {
	sum = x + y
	sub = x - y
	return
}

// 参数不固定
func sum(y int, x ...int) int {
	fmt.Printf("%T \n", y) // int
	fmt.Printf("%T \n", x) // []int x是一个切片
	sum := 0
	for _, v := range x {
		sum = sum + v
	}
	return sum
}

// 作用域问题
// if条件判断、for循环、switch语句上定义的变量也只能在其语句块中生效
func demo1(x, y int) {
	fmt.Println(x, y)
	if x > 0 {
		z := 100
		fmt.Println(z)
	}

	for i := 0; i < 10; i++ {
		fmt.Println(i)
	}
}


// 函数类型与变量
type calculation func(int, int) int

func add(x, y int) int {
	return x + y	
}

var adddemo calculation

// 高阶函数

func gaojie(x, y int, op func(int, int) int) int {
	return op(x, y)
}

// func gaojie2(s string) (func(int, int) int, error) {
// 	switch s {
// 	case "+":
// 		return add, nil
// 	case "-":
// 		return add, nil
// 	default:
// 		err := errors.New("无法识别操作符")
// 		return nil, err
// 	}
// }


// 匿名函数
// 匿名函数因为没有函数名，所以没办法像普通函数那样调用，
// 所以匿名函数需要保存到某个变量或者作为立即执行函数:
// 匿名函数多用于实现回调函数和闭包
var adddemo2  = func (x, y int)  {
	fmt.Println(x + y)
}

// 闭包
func adder() func(int) int {
	var x int
	return func(i int) int {
		x = x + i
		return x
	}
}

// func adder1(x int) func(int) int {
// 	return func(i int) int {
// 		x = x + i
// 		return x
// 	}
// }

// func calc(base int) (func(int) int, func(int) int) {
// 	add := func(i int) int {
// 		base += i
// 		return base
// 	}

// 	sub := func(i int) int {
// 		base -= i
// 		return base
// 	}
// 	return add, sub
// }
// func main() {
// 	f1, f2 := calc(10)
// 	fmt.Println(f1(1), f2(2)) //11 9
// 	fmt.Println(f1(3), f2(4)) //12 8
// 	fmt.Println(f1(5), f2(6)) //13 7
// }


// defer
// defer后的语句将会被延迟处理，延到什么时候？等defer归属的函数即将返回时
// 将延迟的所有语句逆序处理
// 用处：处理资源释放问题。比如：资源清理、文件关闭、解锁及记录时间等。

// return 的指令分为两步，返回值赋值操作和RET指令两步，defer执行的时机
// 就在RET指令执行之前



// 内置函数	   		 介绍
// close	  		主要用来关闭channel
// len	      		用来求长度，比如string、array、slice、map、channel
// new	      		用来分配内存，主要用来分配值类型，比如int、struct。返回的是指针
// make	      		用来分配内存，主要用来分配引用类型，比如chan、map、slice
// append	  		用来追加元素到数组、slice中
// panic和recover	用来做错误处理

func funcA() {
	fmt.Println("func A")
}

// recover()必须搭配defer使用。
// defer一定要在可能引发panic的语句之前定义。
func funcB() {
	defer func() {
		err := recover()
		//如果程序出出现了panic错误,可以通过recover恢复过来
		if err != nil {
			fmt.Println("recover in B")
		}
	}()
	panic("panic in B")
}

func funcC() {
	fmt.Println("func C")
}

func NewFunc() {
	res1 := sum(1, 2, 3)
	res2, _ := calc(1, 3)
	demo1(1, 3)
	adddemo = add
	res3 := adddemo(222, 333)

	res4 := gaojie(100, 200, add)

	func (x, y int)  {
		fmt.Println("-=====")
		fmt.Println(x, y)
	}(10, 40)

	adddemo2(10, 20)
	fmt.Println(res4)
	fmt.Println("----------")

	fmt.Println(res3)
	fmt.Println(res1, res2)

	f := adder() // 在f的生命周期内，变量x一直有效
	fmt.Println(f(10))
	fmt.Println(f(10))
	fmt.Println(f(10))
	fmt.Println(f(10))

	f1 := adder() // 在f1的生命周期内，变量x一直有效
	fmt.Println(f1(20))
	fmt.Println(f1(20))
	fmt.Println(f1(20))

	// start end c b a
	// fmt.Println("start")
	// defer fmt.Println("a")
	// defer fmt.Println("b")
	// defer fmt.Println("c")
	// fmt.Println("end")

	funcA()
	funcB()
	funcC()
}


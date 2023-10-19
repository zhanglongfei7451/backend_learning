package mypack

import (
	"fmt"
	"sync"
)

// goroutine 的调度是随机的。
// 区别于操作系统内核调度操作系统线程，goroutine 的调度是Go语言运行时（runtime）层面的实现，
// 是完全由 Go 语言本身实现的一套调度系统——go scheduler。
// 它的作用是按照一定的规则将所有的 goroutine 调度到操作系统线程上执行

// goruntine是Go语言自身实现的一套调度系统，按照一定的规则将所有的goruntine调度到系统线程上执行
// go语言的调度器采用的是GPM调度模型--------

var wg sync.WaitGroup

// func hello() {
// 	fmt.Println("helloworld")
// 	wg.Done()
// }

func DemoGoRuntine() {
	// wg.Add(1)
	// go hello()
	// fmt.Println("nh")
	// wg.Wait()
	wg.Add(5)

	for i := 0; i < 5; i++ {
		go func(i int) {
			fmt.Println(i)
			wg.Done()
		}(i)
	}
	wg.Wait()
}

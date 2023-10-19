package mypack

import (
	"fmt"
)

// chan<- 只能发;<-chan只能取
func f1(ch chan<- int)  {
	for i := 0; i < 100; i++ {
		ch <- i
	}
	close(ch)
}
func f2(ch1 <-chan int, ch2 chan<- int)  {
	// 从通道中取值方式1
	for{
		tmp, ok := <- ch1
		if !ok{
			break
		}
		ch2 <- tmp*tmp
	}
	close(ch2)
}

func DemoChannel() {
	ch1 := make(chan int ,100)
	ch2 := make(chan int ,200)

	go f1(ch1)
	go f2(ch1, ch2)

	// 从通道中取值方式2
	for ret := range ch2{
		fmt.Println(ret)
	}
}

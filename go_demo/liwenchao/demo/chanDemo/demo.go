package chanDemo

import (
	"fmt"
	"time"
)

func Demo() {
	//无缓冲通道，保证发送和接受的协程在同一时间进行数据交换
	c := make(chan int)
	//c := make(chan int, 10)
	go send(c)
	go recv(c)
	time.Sleep(3 * time.Second)
	close(c)
}

// 只能发送数据
func send(c chan<- int) {
	for i := 0; i < 10; i++ {
		fmt.Println("send ready", i)
		c <- i
		fmt.Println("done", i)
	}
}

// 只能接收数据
func recv(c <-chan int) {
	for i := range c {
		fmt.Println("recv", i)
	}
}

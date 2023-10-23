package lock

import (
	"fmt"
	"sync"
	"time"
)

//func Demo() {
//	wg := sync.WaitGroup{}
//	var lck sync.Mutex
//
//	//defer lck.Unlock()
//	fmt.Println("Locking GO")
//	lck.Lock()
//	fmt.Println("Locked")
//	wg.Add(3)
//
//	for i := 1; i < 4; i++ {
//		go func(i int) {
//			fmt.Println("Locking", i)
//			lck.Lock()
//			fmt.Println("Locked", i)
//
//			//time.Sleep(time.Second * 2)
//			lck.Unlock()
//			fmt.Println("UnLocked", i)
//			wg.Done()
//		}(i)
//	}
//
//	time.Sleep(time.Second * 5)
//	fmt.Println("Ready unlock")
//	lck.Unlock()
//	fmt.Println("unlocked")
//	wg.Wait()
//}

var (
	x      int64
	wg     sync.WaitGroup
	rwlock sync.RWMutex
)

func Demo() {
	start := time.Now()
	for i := 0; i < 10; i++ {
		wg.Add(1)
		go write()
	}
	for i := 0; i < 1000; i++ {
		wg.Add(1)
		go read()
	}
	wg.Wait()
	end := time.Now()
	fmt.Println(end.Sub(start))
}

func write() {
	rwlock.Lock() // 加写锁
	x = x + 1
	time.Sleep(10 * time.Millisecond) // 假设读操作耗时10毫秒
	rwlock.Unlock()                   // 解写锁
	wg.Done()
}

func read() {
	rwlock.RLock()               // 加读锁
	time.Sleep(time.Millisecond) // 假设读操作耗时1毫秒
	rwlock.RUnlock()             // 解读锁
	wg.Done()
}

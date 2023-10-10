package mypack

import (
	"fmt"
)

func DemoMap() {
	// go语言中映射关系的容器是map，内部使用散列表hash实现
	// 无序的key-value数据结构，map是引用类型，必须初始化才可以使用

	scoreMap := make(map[string]int, 8)
	scoreMap["张三"] = 90
	scoreMap["李四"] = 100
	fmt.Println(scoreMap) //map[张三:90 李四:100]
	fmt.Printf("type of a:%T\n", scoreMap) //type of a:map[string]int
	userInfo := map[string]string{
		"username": "沙河小王子",
		"password": "123456",
	}
	fmt.Println(userInfo) // map[password:123456 username:沙河小王子]

	// 如果key存在ok为true,v为对应的值；不存在ok为false,v为值类型的零值
	v, ok := scoreMap["张三"]
	if ok {
		fmt.Println(v)
	} else {
		fmt.Println("查无此人")
	}

	// Go语言中使用for range遍历map。遍历map时的元素顺序与添加键值对的顺序无关。
	for k, v := range scoreMap {
		fmt.Println(k, v)
	}

	delete(scoreMap, "张三")

	var mapSlice = make([]map[string]string, 3)
	for index, value := range mapSlice {
		fmt.Printf("index:%d value:%v\n", index, value)
	}
	fmt.Println("after init")
	// 对切片中的map元素进行初始化
	mapSlice[0] = make(map[string]string, 10)
	mapSlice[0]["name"] = "小王子"
	mapSlice[0]["password"] = "123456"
	mapSlice[0]["address"] = "沙河"
	for index, value := range mapSlice {
		fmt.Printf("index:%d value:%v\n", index, value)
	}
}

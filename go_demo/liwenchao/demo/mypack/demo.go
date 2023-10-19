package mypack

import (
	"fmt"
)

func Demo() {
	var arr1 = [3]int{1, 2, 3}
	fmt.Printf("%T", arr1) //*[5]int
	fmt.Println(arr1)
	fmt.Printf("%p \n", &arr1)
	for _, v := range &arr1 {
		fmt.Println(v)
	}
}

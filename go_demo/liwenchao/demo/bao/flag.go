package bao

import (
	"flag"
	"fmt"
)

func Demo() {
	name := flag.String("name", "zhang", "姓名")
	married := flag.Bool("married", false, "婚否")
	flag.Parse()
	args := flag.Args()
	fmt.Println(*name)
	fmt.Println(*married)
	fmt.Println("---")

	for _, value := range args {
		fmt.Printf(value)
	}

}

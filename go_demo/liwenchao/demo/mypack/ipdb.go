package mypack

import (
	"fmt"
	"github.com/ipipdotnet/ipdb-go"
)

func Ipdb() {

	db, err := ipdb.NewCity("D:\\1—SUYAN\\learing\\backend_learning\\go_demo\\liwenchao\\demo\\mypack\\ipdb\\city.ipv4.ipdb")
	if err != nil {
		// 处理错误
	}
	fmt.Println(db)

	info, err := db.FindInfo("192.0.2.0", "") // 查询IP地址
	if err != nil {
		// 处理错误
	}
	fmt.Printf("%+v\n", info)
}

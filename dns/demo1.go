//package main
//
//import (
//	"fmt"
//	"github.com/miekg/dns"
//)
//
//func main() {
//	var msg dns.Msg                             //创建一个Msg
//	fqdn := dns.Fqdn("stacktitan.com")          //调用fqdn将域转换为可以与DNS服务交换的FQDN
//	msg.SetQuestion(fqdn, dns.TypeA)            //设置查询A记录
//	in, err := dns.Exchange(&msg, "8.8.8.8:53") //将消息发送到DNS服务器
//	if err != nil {                             //判断是否有错误;如果有则打印输出
//		panic(err)
//	}
//	if len(in.Answer) < 1 { //判断是否有响应内容,如果没有则输出没有记录并退出
//		fmt.Println("No records")
//		return
//	}
//	for _, answer := range in.Answer { //遍历所有应答
//		if a, ok := answer.(*dns.A); ok { //将类型为A记录的类型取出;ok用于断言判断类型是否为*dns.A
//			fmt.Println(a.A) //打印输出
//		}
//	}
//}

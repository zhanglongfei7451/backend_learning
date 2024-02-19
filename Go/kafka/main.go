//package main
//
//import (
//	"context"
//	"fmt"
//	"log"
//	"time"
//
//	"github.com/segmentio/kafka-go"
//)
//
//func main() {
//
//	//mechanism, err := scram.Mechanism(scram.SHA512, "admin", "d451c8a831fd34f20af64665c62b45aa")
//	//if err != nil {
//	//	panic(err)
//	//}
//
//	dialer := &kafka.Dialer{
//		Timeout:   10 * time.Second,
//		DualStack: true,
//		//SASLMechanism: mechanism,
//	}
//
//	// 创建一个reader，指定GroupID，从 topic-A 消费消息
//	r := kafka.NewReader(kafka.ReaderConfig{
//		Brokers:  []string{"10.253.81.102:9092", "10.253.76.39:9092", "10.253.76.38:9092"},
//		Topic:    "LOG_438_coredns_log_137",
//		MaxBytes: 10e6, // 10MB
//		Dialer:   dialer,
//	})
//
//	// 接收消息
//	for {
//		m, err := r.ReadMessage(context.Background())
//		if err != nil {
//			break
//		}
//		fmt.Printf("message at topic/partition/offset %v/%v/%v: %s = %s\n", m.Topic, m.Partition, m.Offset, string(m.Key), string(m.Value))
//	}
//
//	// 程序退出前关闭Reader
//	if err := r.Close(); err != nil {
//		log.Fatal("failed to close reader:", err)
//	}
//}

//package main
//
//import (
//	"context"
//	"crypto/tls"
//	"fmt"
//	"log"
//	"time"
//
//	"github.com/segmentio/kafka-go"
//)
//
//func main() {
//	brokers := []string{"10.253.81.102:9092", "10.253.76.39:9092", "10.253.76.38:9092"}
//	topic := "LOG_438_coredns_log_137"
//	kafkaSaslUsername := "admin"
//	kafkaSaslPassword := "d451c8a831fd34f20af64665c62b45aa"
//	kafkaSecurityProtocol := "SASL_PLAINTEXT" // 或者 "sasl_ssl" 根据您的Kafka集群配置
//	saslMechanism := "SCRAM-SHA-512"                // 或者 SCRAM-SHA-256/SCRAM-SHA-512 根据实际情况选择
//
//	var tlsConfig *tls.Config // 可选，如果需要SSL/TLS加密，请根据实际情况初始化这个变量
//
//	reader := kafka.NewReader(kafka.ReaderConfig{
//		Brokers:         brokers,
//		Topic:           topic,
//		GroupID:         "your_group_id", // 可选，如果希望进行组管理
//		MinBytes:        10e3,            // 请求至少这么多字节的数据才会返回响应
//		MaxBytes:        10e6,            // 最大请求数据量
//		MaxWait:         5 * time.Second,  // 最长等待时间
//		SASLHandshake:   true,
//		SASLMechanism:   saslMechanism,
//		SASLUsername:    kafkaSaslUsername,
//		SASLPassword:    kafkaSaslPassword,
//		TLS:             tlsConfig, // 如果 kafkaSecurityProtocol 为 "sasl_ssl"，请设置此字段
//	})
//
//	for {
//		m, err := reader.ReadMessage(context.Background())
//		if err != nil {
//			log.Fatal("Failed to read message:", err)
//		}
//		fmt.Printf("Message received: Key = %s, Value = %s, Topic = %s, Partition = %d, Offset

package main

import (
	"context"
	"fmt"
	"github.com/segmentio/kafka-go"
	"github.com/segmentio/kafka-go/sasl/scram"
	"log"
)

func main() {
	// 定义 Kafka 代理地址
	brokers := []string{"10.253.81.102:9092", "10.253.76.39:9092", "10.253.76.38:9092"}

	// 定义 Kafka 主题
	topic := "LOG_438_coredns_log_137"

	mechanism, _ := scram.Mechanism(scram.SHA512, "admin", "$AXpz3U9D@eG")

	// 创建一个新的 Kafka 读取器配置
	readerConfig := kafka.ReaderConfig{
		Brokers: brokers,
		//GroupID: "my-group", // 指定一个唯一的消费者组ID
		Topic: topic,

		// 通过 Dialer 配置 SASL 信息
		Dialer: &kafka.Dialer{
			SASLMechanism: mechanism,
		},
	}

	// 创建一个新的 Kafka 读取器
	reader := kafka.NewReader(readerConfig)

	// 在程序退出时关闭读取器
	defer reader.Close()

	// 运行一个无限循环以持续消费消息
	for {
		// 从 Kafka 主题读取下一条消息
		msg, err := reader.ReadMessage(context.Background())
		if err != nil {
			log.Fatal("读取消息时发生错误:", err)
		}

		// 打印接收到的消息值
		fmt.Printf("接收到消息: %s\n", msg.Value)
	}
}

<<<<<<< HEAD
package main

import (
	"fmt"
	"log"

	"github.com/Shopify/sarama"
)

func main() {
	brokers := []string{"10.253.81.102:9092", "10.253.76.39:9092", "10.253.76.38:9092"}

	config := sarama.NewConfig()
	config.Version = sarama.V2_8_0_0 // 根据您的 Kafka 服务器版本选择合适的版本

	// 设置安全协议
	switch kafkaSecurityProtocol := "kafka_security_protocol"; kafkaSecurityProtocol {
	case "SASL_PLAINTEXT":
		config.Net.SASL.Enable = true
		config.Net.SASL.Mechanism = sarama.SASLTypePlaintext
	case "SASL_SSL":
		config.Net.SASL.Enable = true
		config.Net.SASL.Mechanism = sarama.SASLTypePlaintext
		config.Net.TLS.Enable = true
	default:
		log.Fatalf("Unsupported security protocol: %s", kafkaSecurityProtocol)
	}

	// 设置 SASL 认证信息
	config.Net.SASL.User = "kafka_sasl_username"
	config.Net.SASL.Password = "kafka_sasl_password"

	consumer, err := sarama.NewConsumer(brokers, config)
	if err != nil {
		log.Fatal("Error creating consumer:", err)
	}
	defer func() {
		if err := consumer.Close(); err != nil {
			log.Println("Failed to close consumer:", err)
		}
	}()

	partitionConsumer, err := consumer.ConsumePartition("your_topic_name", 0, sarama.OffsetNewest)
	if err != nil {
		log.Fatal("Error creating partition consumer:", err)
	}
	defer func() {
		if err := partitionConsumer.Close(); err != nil {
			log.Println("Failed to close partition consumer:", err)
		}
	}()

	for msg := range partitionConsumer.Messages() {
		fmt.Printf("Message received: Key = %s, Value = %s, Topic = %s, Partition = %d, Offset = %d\n",
			string(msg.Key), string(msg.Value), msg.Topic, msg.Partition, msg.Offset)
=======
package mypack

import (
	"context"
	"errors"
	"fmt"
	"log"
	"time"

	"github.com/segmentio/kafka-go"
)

// 定义Kafka服务地址、主题名以及消息内容
const (
	brokers = "192.168.241.140:9092"
	topic   = "my-topic"
)

func Kafka() {
	// 生产者部分
	produce()

	// 消费者部分（可以放在不同的goroutine或者程序中）
	consume()
}

func produce() {
	// 创建一个写入器来连接到Kafka集群并指定要写入的主题
	writer := kafka.NewWriter(kafka.WriterConfig{
		Brokers: []string{brokers},
		Topic:   topic,
	})

	// 生产三条消息
	messages := []kafka.Message{
		{Value: []byte("Message 1")},
		{Value: []byte("Message 2")},
		{Value: []byte("Message 3")},
	}

	for _, msg := range messages {
		err := writer.WriteMessages(context.Background(), msg)
		if err != nil {
			log.Fatal("Failed to write message:", err)
		}
		fmt.Println("Sent message:", string(msg.Value))
	}

	// 确保所有已发送的消息都已成功提交到Kafka
	err := writer.Close()
	if err != nil {
		log.Fatal("Failed to close writer:", err)
	}
}

func consume() {
	// 创建一个读取器来连接到Kafka集群并指定要读取的主题
	reader := kafka.NewReader(kafka.ReaderConfig{
		Brokers:  []string{brokers},
		Topic:    topic,
		MinBytes: 10e3, // 设置最小拉取字节数，避免频繁拉取
		MaxBytes: 10e6, // 设置最大拉取字节数
	})

	defer reader.Close()

	for {
		// 从Kafka主题中读取消息
		msg, err := reader.ReadMessage(context.Background())
		if err != nil {
			// 如果错误为EOF，说明没有更多消息了，可以退出循环
			if errors.Is(err, context.DeadlineExceeded) {
				break
			}
			log.Fatal("Failed to read message:", err)
		}

		fmt.Printf("Received message offset %d with value '%s'\n", msg.Offset, string(msg.Value))

		// 处理收到的消息...
		time.Sleep(1 * time.Second) // 假设处理消息需要一定时间，这里仅做模拟
>>>>>>> 1345c31313eb9273ad99ce5c37f5d8fb72b0646f
	}
}

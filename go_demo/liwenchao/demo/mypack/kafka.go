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
	}
}

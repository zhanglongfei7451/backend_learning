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
	}
}

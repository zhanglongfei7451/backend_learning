package main

import (
	"fmt"
	"github.com/gocarina/gocsv"
	"os"
)

type NotUsed struct {
	Name string
}

type Client struct { // Our example struct, you can use "-" to ignore a field
	Id            string  `csv:"client_id"`
	Name          string  `csv:"client_name"`
	Age           string  `csv:"client_age"`
	NotUsedString string  `csv:"-"`
	NotUsedStruct NotUsed `csv:"-"`
}

func main() {
	clientsFile, err := os.OpenFile("clients.csv", os.O_RDWR|os.O_CREATE, os.ModePerm)
	if err != nil {
		panic(err)
	}
	defer clientsFile.Close()

	clients := []*Client{}

	if err := gocsv.UnmarshalFile(clientsFile, &clients); err != nil { // Load clients from file
		panic(err)
	}
	for _, client := range clients {
		fmt.Println("Hello", client.Name)
	}

	if _, err := clientsFile.Seek(0, 0); err != nil { // Go to the start of the file
		panic(err)
	}

	clients = append(clients, &Client{Id: "12", Name: "John", Age: "21"}) // Add clients
	clients = append(clients, &Client{Id: "13", Name: "Fred"})
	clients = append(clients, &Client{Id: "14", Name: "James", Age: "32"})
	clients = append(clients, &Client{Id: "15", Name: "Danny"})
	err = gocsv.Marshal(&clients, clientsFile) // Get all clients as CSV string
	//err = gocsv.MarshalFile(&clients, clientsFile) // Use this to save the CSV back to the file
	if err != nil {
		fmt.Println(err)
	}

}

//
//func main() {
//	//var dig dnsutil.Dig
//	//if err := dig.SetBackupDNS("8.8.8.8"); err != nil {
//	//	fmt.Println(err)
//	//	return
//	//}
//	//a, err := dig.GetMsg(dns.TypeA, "baidu.com")
//	//if err != nil {
//	//	fmt.Println(err)
//	//	return
//	//}
//	//
//	//fmt.Println(a)
//}

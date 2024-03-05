// asn-writer is an example of how to create an ASN MaxMind DB file from the
// GeoLite2 ASN CSVs. You must have the CSVs in the current working directory.
package main

import (
	"encoding/csv"
	"io"
	"log"
	"net"
	"os"
	"strings"

	"github.com/maxmind/mmdbwriter"
	"github.com/maxmind/mmdbwriter/mmdbtype"
)

func main() {
	writer, err := mmdbwriter.New(
		mmdbwriter.Options{
			DatabaseType: "My-ASN-DB",
			RecordSize:   24,
		},
	)
	if err != nil {
		log.Fatal(err)
	}

	for _, file := range []string{"D:\\1—SUYAN\\learing\\backend_learning\\go_demo\\mmdbwriter\\examples\\asn-writer\\GeoLite2-ASN-Blocks-IPv4.csv"} {
		fh, err := os.Open(file)
		if err != nil {
			log.Fatal(err)
		}

		r := csv.NewReader(fh)

		// first line
		r.Read()

		for {
			row, err := r.Read()
			if err == io.EOF {
				break
			}
			if err != nil {
				log.Fatal(err)
			}

			parts := strings.Split(row[0], "-")

			start := net.ParseIP(parts[0])
			end := net.ParseIP(parts[1])

			record := mmdbtype.Map{}

			record["autonomous_system_organization"] = mmdbtype.String(row[1])

			err = writer.InsertRange(start, end, record)
			if err != nil {
				log.Fatal(err)
			}
		}
	}

	fh, err := os.Create("out.mmdb")
	if err != nil {
		log.Fatal(err)
	}

	_, err = writer.WriteTo(fh)
	if err != nil {
		log.Fatal(err)
	}
}

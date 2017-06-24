package main

import (
	"fmt"

	"flag"

	"os"

	"github.com/azenakhi/go-makefile/model"
	"github.com/azenakhi/go-makefile/service"
)

var (
	BUILDTIME string
	BRANCH    string
	VERSION   string
	COMMIT    string
)

func info() {
	info := flag.Bool("info", false, "More information")
	flag.Parse()
	if *info {
		fmt.Printf("Build: %s\n", BUILDTIME)
		fmt.Printf("Commit: %s\n", COMMIT)
		fmt.Printf("Branch: %s\n", BRANCH)
		fmt.Printf("Version: %s\n", VERSION)
		os.Exit(0)
	}
}

func main() {
	info()
	pm := model.PersonModel{Name: "Ahmed"}
	ps := service.NewPersonService(pm)
	fmt.Println(ps.GetPerson())
}

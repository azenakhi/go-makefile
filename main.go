package main

import (
	"fmt"

	"github.com/azenakhi/go-makefile/model"
	"github.com/azenakhi/go-makefile/service"
)

func main() {
	pm := model.PersonModel{Name: "Ahmed"}
	ps := service.NewPersonService(pm)
	fmt.Println(ps.GetPerson())
}

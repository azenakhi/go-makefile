package model

type PersonModel struct {
	Name string
	Age  string
}

func NewPersonModel() *PersonModel {
	return &PersonModel{}
}

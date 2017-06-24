package service

import (
	"github.com/azenakhi/go-makefile/model"
)

type PersonService struct {
	personModel model.PersonModel
}

func NewPersonService(pm model.PersonModel) *PersonService {
	return &PersonService{personModel: pm}
}

func (ps PersonService) GetPerson() model.PersonModel {
	return ps.personModel
}

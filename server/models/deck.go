package models

import (
	"github.com/uptrace/bun"
)

type Deck struct {
	bun.BaseModel `bun:",alias:d"`

	Hash      string `bun:",pk"`
	Subject   string `bun:",notnull"`
	Module    string `bun:",notnull"`
	ModuleAlt string `bun:",notnull"`
	Examiners string `bun:",notnull"`
	Language  string `bun:",notnull"`
	Semester  string `bun:",notnull"`
	Year      int    `bun:",notnull"`
	Filetype  string `bun:",notnull"`
	IsValid   *bool  `bun:",default:false,notnull"`
}

package models

import (
	"time"

	"github.com/uptrace/bun"
)

type Session struct {
	bun.BaseModel `bun:",alias:s"`

	Token     string
	ExpiresAt time.Time
}

package db

import (
	"context"
	"database/sql"

	"github.com/FachschaftMathPhysInfo/cards/server/models"
	log "github.com/sirupsen/logrus"
	"github.com/uptrace/bun"
	"github.com/uptrace/bun/dialect/sqlitedialect"
	_ "modernc.org/sqlite"
)

var (
	db    *bun.DB
	sqldb *sql.DB
	err   error

	tables = []interface{}{
		(*models.Deck)(nil)}
)

func Init(ctx context.Context) (*bun.DB, *sql.DB, error) {
	sqldb, err = sql.Open("sqlite", "file:./storage/stapel.db?_pragma=foreign_keys(1)")
	if err != nil {
		log.Panic("sqlite creation failed: ", err)
	}
	db = bun.NewDB(sqldb, sqlitedialect.New())

	if err := createTables(ctx, tables); err != nil {
		log.Panic("unable to insert basic relations in DB: ", err)
	}

	return db, sqldb, nil
}

func createTables(ctx context.Context, tables []interface{}) error {
	for _, table := range tables {
		if _, err := db.NewCreateTable().
			Model(table).
			IfNotExists().
			Exec(ctx); err != nil {
			return err
		}
	}

	return nil
}

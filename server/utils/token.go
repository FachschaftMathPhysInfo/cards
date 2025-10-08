package utils

import (
	"context"
	"crypto/rand"
	"encoding/base64"
	"fmt"
	"time"

	"github.com/FachschaftMathPhysInfo/cards/server/models"
	"github.com/uptrace/bun"
)

func randomURLSafeString(nBytes int) (string, error) {
	if nBytes <= 0 {
		return "", fmt.Errorf("nBytes must be > 0")
	}
	b := make([]byte, nBytes)
	if _, err := rand.Read(b); err != nil {
		return "", err
	}
	return base64.RawURLEncoding.EncodeToString(b), nil
}

func Login(ctx context.Context, db *bun.DB) (string, error) {
	token, err := randomURLSafeString(30)
	if err != nil {
		return "", fmt.Errorf("Token generation failed")
	}

	session := &models.Session{
		Token:     token,
		ExpiresAt: time.Now().Add(7 * 24 * time.Hour),
	}

	if _, err := db.NewInsert().
		Model(session).
		Exec(ctx); err != nil {
		fmt.Print(err)
		return "", fmt.Errorf("Internal Server Error")
	}

	return token, nil
}

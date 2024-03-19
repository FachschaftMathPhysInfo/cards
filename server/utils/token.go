package utils

import (
	"encoding/json"
	"fmt"
	"net/http"
	"os"
	"time"

	jwt "github.com/dgrijalva/jwt-go"
	"github.com/go-chi/jwtauth"
)

// User represents a user in the system
type User struct {
	Username string `json:"username"`
}

// CreateJWTToken creates a JWT token for the given user
func CreateJWTToken(user *User, tokenAuth *jwtauth.JWTAuth) (*string, error) {
	userJSON, err := json.Marshal(user)
	if err != nil {
		return nil, err
	}

	// Create JWT token claims
	claims := map[string]interface{}{"user": string(userJSON)}
	jwtauth.SetExpiryIn(claims, time.Hour)
	_, tokenString, err := tokenAuth.Encode(claims)
	if err != nil {
		return nil, err
	}

	return &tokenString, nil
}

func VerifyToken(tokenString string) error {
	claims := jwt.MapClaims{}
	token, err := jwt.ParseWithClaims(tokenString, &claims, func(token *jwt.Token) (interface{}, error) {
		// Check the signing method and provide the secret key
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
		}
		return []byte(os.Getenv("JWT_SECRET_KEY")), nil
	})
	if err != nil {
		return err
	}

	if !token.Valid {
		return fmt.Errorf("invalid token")
	}

	return nil
}

func ReturnJWTToken(username string, w http.ResponseWriter, r *http.Request) {
	user := &User{Username: username}
	tokenAuth := jwtauth.New("HS256", []byte(os.Getenv("JWT_SECRET_KEY")), nil)
	jwtToken, err := CreateJWTToken(user, tokenAuth)
	if err != nil {
		http.Error(w, "Failed to create JWT token", http.StatusInternalServerError)
		fmt.Println(err)
		return
	}

	redirectUrl := fmt.Sprintf("%s?token=%s", os.Getenv("FRONTEND_URL"), *jwtToken)
	http.Redirect(w, r, redirectUrl, http.StatusSeeOther)
}

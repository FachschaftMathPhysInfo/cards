package utils

import (
	"encoding/json"
	"fmt"
	"net/http"
	"os"
	"time"

	jwt "github.com/dgrijalva/jwt-go"
	"github.com/go-chi/jwtauth"
	"github.com/go-ldap/ldap"
)

// User represents a user in the system
type User struct {
	Username string `json:"username"`
}

// createJWTCookie creates a JWT token for the given user
func CreateJWTCookie(user *User, tokenAuth *jwtauth.JWTAuth) (*http.Cookie, error) {
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

	// Create JWT token cookie
	jwtCookie := &http.Cookie{
		Name:     "jwt",
		Value:    tokenString,
		HttpOnly: true,
		Path:     "/",
		Expires:  time.Now().Add(time.Hour), // Set expiration time
	}

	return jwtCookie, nil
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

func HandleLogin(w http.ResponseWriter, r *http.Request) {
	username, password, ok := r.BasicAuth()
	if !ok {
		http.Error(w, "Unauthorized", http.StatusUnauthorized)
		return
	}

	// Authenticate with Kerberos via LDAP
	ldapURL := os.Getenv("LDAP_URL")
	l, err := ldap.DialURL(ldapURL)
	if err != nil {
		fmt.Println("LDAP dial error:", err)
		http.Error(w, "Internal Server Error", http.StatusInternalServerError)
		return
	}
	defer l.Close()

	err = l.Bind(username, password)
	if err != nil {
		fmt.Println("LDAP bind error:", err)
		http.Error(w, "Unauthorized", http.StatusUnauthorized)
		return
	}

	// If authentication is successful, create JWT token for the user
	user := &User{Username: username}
	tokenAuth := jwtauth.New("HS256", []byte(os.Getenv("JWT_SECRET_KEY")), nil)
	jwtCookie, err := CreateJWTCookie(user, tokenAuth)
	if err != nil {
		http.Error(w, "Failed to create JWT token", http.StatusInternalServerError)
		fmt.Println(err)
		return
	}

	// Return JWT token to caller
	response := map[string]string{"jwt": jwtCookie.Value}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

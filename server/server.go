package main

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"time"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/FachschaftMathPhysInfo/cards/server/graph"
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/jwtauth"
	"github.com/rs/cors"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

const defaultPort = "8080"

func main() {
	client, err := mongo.Connect(context.Background(), options.Client().ApplyURI("mongodb://localhost:27017"))
	if err != nil {
		log.Fatal(err)
	}
	defer client.Disconnect(context.Background())

	database := client.Database("cards")
	gqlResolvers := graph.Resolver{DB: database}

	router := chi.NewRouter()

	// Set up CORS
	router.Use(cors.New(cors.Options{
		AllowedHeaders:   []string{"*"},
		AllowCredentials: true,
		Debug:            false,
	}).Handler)

	// Initialize JWT authentication
	tokenAuth := jwtauth.New("HS256", []byte(os.Getenv("JWT_SECRET_KEY")), nil)

	// Route for user login
	router.Get("/login/{username}", func(w http.ResponseWriter, r *http.Request) {
		username := chi.URLParam(r, "username")
		user := &User{Username: username}

		// Create JWT token for the user
		jwtCookie, err := createJWTCookie(user, tokenAuth)
		if err != nil {
			http.Error(w, "Failed to create JWT token", http.StatusInternalServerError)
			fmt.Println(err)
			return
		}

		// Return JWT token to caller
		response := map[string]string{"jwt": jwtCookie.Value}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(response)
	})

	// Serve GraphQL endpoint without authentication
	srv := handler.NewDefaultServer(graph.NewExecutableSchema(graph.Config{Resolvers: &gqlResolvers}))
	router.Handle("/graphql", srv)

	// Serve deck files
	fileServer := http.FileServer(http.Dir("./deckfiles"))
	router.Handle("/deckfiles/*", http.StripPrefix("/deckfiles/", fileServer))

	// Serve GraphQL playground
	router.Handle("/", playground.Handler("GraphQL playground", "/graphql"))

	log.Printf("Connect to http://localhost:%s/ for GraphQL playground", defaultPort)
	log.Fatal(http.ListenAndServe(":"+defaultPort, router))
}

// User represents a user in the system
type User struct {
	Username string `json:"username"`
}

// createJWTCookie creates a JWT token for the given user
func createJWTCookie(user *User, tokenAuth *jwtauth.JWTAuth) (*http.Cookie, error) {
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

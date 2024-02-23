package main

import (
	"context"
	"log"
	"net/http"
	"os"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/FachschaftMathPhysInfo/cards/server/graph"
	"github.com/FachschaftMathPhysInfo/cards/server/utils"
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/rs/cors"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

const defaultPort = "8080"

func main() {
	client, err := mongo.Connect(context.Background(), options.Client().ApplyURI("mongodb://database:27017"))
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

	// Middleware
	router.Use(middleware.Logger)

	// Route for user login
	router.Post("/login/", utils.HandleLogin)

	// Serve GraphQL endpoint
	srv := handler.NewDefaultServer(graph.NewExecutableSchema(graph.Config{Resolvers: &gqlResolvers}))
	router.Handle("/graphql", srv)

	// Serve deck files
	fileServer := http.FileServer(http.Dir("./deckfiles"))
	router.Handle("/deckfiles/*", http.StripPrefix("/deckfiles/", fileServer))

	if os.Getenv("ENVIRONMENT") != "production" {
		// Serve GraphQL playground
		router.Handle("/", playground.Handler("GraphQL playground", "/graphql"))

		log.Printf("Connect to http://localhost:%s/ for GraphQL playground", defaultPort)
	}

	log.Printf("Server running on http://localhost:%s", defaultPort)
	log.Fatal(http.ListenAndServe(":"+defaultPort, router))
}

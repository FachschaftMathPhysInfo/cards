package main

import (
	"context"
	"log"
	"net/http"

	"github.com/99designs/gqlgen/graphql"
	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/FachschaftMathPhysInfo/cards/server/db"
	"github.com/FachschaftMathPhysInfo/cards/server/graph"
	"github.com/FachschaftMathPhysInfo/cards/server/utils"
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/rs/cors"
	"github.com/sirupsen/logrus"
)

const (
	defaultPort = "8080"
	jwtHeader   = "JWT"
)

func main() {
	ctx := context.Background()
	db, sqldb, err := db.Init(ctx)
	defer sqldb.Close()
	defer db.Close()
	if err != nil {
		logrus.Fatal(err)
	}

	gqlResolver := graph.Resolver{DB: db}
	gc := graph.Config{Resolvers: &gqlResolver}
	gc.Directives.Auth = func(ctx context.Context, obj interface{}, next graphql.Resolver) (res interface{}, err error) {
		jwt, _ := ctx.Value("jwt").(string)
		if err := utils.VerifyToken(jwt); err != nil {
			return nil, err
		}
		return next(ctx)
	}

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
	router.Get("/login/", func(w http.ResponseWriter, r *http.Request) {
		username := r.Header.Get("X-Username")
		if username == "" {
			username = "testuser"
		}
		utils.ReturnJWTToken(username, w, r)
	})

	// Serve GraphQL endpoint
	srv := handler.NewDefaultServer(graph.NewExecutableSchema(gc))
	router.With(func(h http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			jwt := r.Header.Get(jwtHeader)
			if jwt != "" {
				ctx = context.WithValue(ctx, "jwt", jwt)
			}
			h.ServeHTTP(w, r.WithContext(ctx))
		})
	}).Handle("/graphql", srv)

	// Serve deck files
	fileServer := http.FileServer(http.Dir("./deckfiles"))
	router.Handle("/deckfiles/*", http.StripPrefix("/deckfiles/", fileServer))

	// Serve GraphQL playground
	router.Handle("/playground", playground.Handler("GraphQL playground", "/graphql"))

	log.Printf("Server running on http://localhost:%s", defaultPort)
	log.Fatal(http.ListenAndServe(":"+defaultPort, router))
}

package main

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"net/http/httputil"
	"net/url"
	"os"

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
	tokenHeader = "TOKEN"
)

func main() {
	publicUrl := os.Getenv("PUBLIC_URL")
	if publicUrl == "" {
		publicUrl = "http://localhost:8080"
	}

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
		token, _ := ctx.Value("token").(string)
		isValid, _ := gqlResolver.Query().IsActiveSession(ctx, token)
		if isValid {
			return next(ctx)
		}
		return
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
	router.Get("/login", func(w http.ResponseWriter, r *http.Request) {
		token, err := utils.Login(ctx, db)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		}

		http.Redirect(w, r, fmt.Sprintf("%s?token=%s", publicUrl, token), http.StatusFound)
	})

	// Serve GraphQL endpoint
	srv := handler.NewDefaultServer(graph.NewExecutableSchema(gc))
	router.Handle("/graphql", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		reqCtx := r.Context()
		token := r.Header.Get(tokenHeader)
		if token != "" {
			reqCtx = context.WithValue(reqCtx, "token", token)
		}
		srv.ServeHTTP(w, r.WithContext(reqCtx))
	}))

	// Serve deck files
	fileServer := http.FileServer(http.Dir("./deckfiles"))
	router.Handle("/deckfiles/*", http.StripPrefix("/deckfiles/", fileServer))

	frontendUrl, _ := url.Parse("http://localhost:3000")
	router.Handle("/*", httputil.NewSingleHostReverseProxy(frontendUrl))

	// Serve GraphQL playground
	router.Handle("/playground", playground.Handler("GraphQL playground", "/graphql"))

	log.Printf("Server running on http://localhost:%s", defaultPort)
	log.Fatal(http.ListenAndServe(":"+defaultPort, router))
}

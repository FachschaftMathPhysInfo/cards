package main

import (
	"context"
	"fmt"
	"net/http"
	"net/http/httputil"
	"net/url"
	"os"
	"time"

	"github.com/99designs/gqlgen/graphql"
	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/handler/transport"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/FachschaftMathPhysInfo/cards/server/db"
	"github.com/FachschaftMathPhysInfo/cards/server/graph"
	mw "github.com/FachschaftMathPhysInfo/cards/server/middleware"
	"github.com/FachschaftMathPhysInfo/cards/server/utils"
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/rs/cors"
	"github.com/sirupsen/logrus"
)

const (
	defaultPort     = "8080"
	tokenCookieName = "token"
)

func main() {
	isDevelopment := os.Getenv("ENV") == "Development"

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
		isValid, _ := gqlResolver.Query().IsActiveSession(ctx)
		if isValid {
			return next(ctx)
		}
		return nil, fmt.Errorf("Access denied")
	}

	router := chi.NewRouter()

	// Set up CORS
	router.Use(cors.New(cors.Options{
		AllowedHeaders:   []string{tokenCookieName},
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

		http.SetCookie(w, &http.Cookie{
			Name:     tokenCookieName,
			Value:    token,
			Path:     "/",
			Expires:  time.Now().Add(7 * 24 * time.Hour),
			Secure:   !isDevelopment,
			HttpOnly: true,
			SameSite: http.SameSiteStrictMode,
		})

		http.Redirect(w, r, publicUrl+"?l=1", http.StatusSeeOther)
	})

	// Serve GraphQL endpoint
	srv := handler.NewDefaultServer(graph.NewExecutableSchema(gc))
	srv.AddTransport(transport.MultipartForm{
		MaxMemory:     32 << 20,
		MaxUploadSize: 100 << 20,
	})
	router.Handle("/graphql", mw.WithResponseWriter(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		reqCtx := r.Context()
		c, _ := r.Cookie(tokenCookieName)
		if c != nil && c.Value != "" {
			reqCtx = context.WithValue(reqCtx, "token", c.Value)
		}
		srv.ServeHTTP(w, r.WithContext(reqCtx))
	})))

	// Serve deck files
	fileServer := http.StripPrefix("/deckfiles/", http.FileServer(http.Dir("./storage/deckfiles")))
	router.Handle("/deckfiles/*", fileServer)

	frontendUrl, _ := url.Parse("http://localhost:3000")
	router.Handle("/*", httputil.NewSingleHostReverseProxy(frontendUrl))

	// Serve GraphQL playground
	if isDevelopment {
		router.Handle("/playground", playground.Handler("GraphQL playground", "/graphql"))
	}

	logrus.Infof("Server running on http://localhost:%s", defaultPort)
	logrus.Fatal(http.ListenAndServe(":"+defaultPort, router))
}

package graph

// This file will not be regenerated automatically.
//
// It serves as dependency injection for your app, add any dependencies you require here.

import (
	"go.mongodb.org/mongo-driver/mongo"
)

type Resolver struct {
	DB *mongo.Database
}

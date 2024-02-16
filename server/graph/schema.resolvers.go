package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.43

import (
	"bytes"
	"context"
	"crypto/sha256"
	"encoding/hex"
	"fmt"
	"io"
	"log"
	"os"
	"path/filepath"

	"github.com/FachschaftMathPhysInfo/cards/server/graph/model"
	"github.com/dgrijalva/jwt-go"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
)

// CreateDeck is the resolver for the createDeck field.
func (r *mutationResolver) CreateDeck(ctx context.Context, input model.NewDeck) (*model.Deck, error) {
	cardDecks := r.DB.Collection("cardDecks")

	if input.Semester != nil && !(*input.Semester == "SoSe" || *input.Semester == "WiSe") {
		return nil, fmt.Errorf("Input \"%s\" is not a valid input for field input.Semester", *input.Semester)
	}

	// hash and copy to the buffer at the same time
	fileBuf := &bytes.Buffer{}
	tee := io.TeeReader(input.File.File, fileBuf)

	// generate the hash of the input file
	fileHash := sha256.New()
	if _, err := io.Copy(fileHash, tee); err != nil {
		log.Fatal(err)
	}
	encodedHash := hex.EncodeToString(fileHash.Sum(nil))

	dbDeck := model.Deck{}

	// check if the deck already exists
	filter := bson.D{{Key: "hash", Value: encodedHash}}
	searchRes := cardDecks.FindOne(context.Background(), filter).Decode(&dbDeck)
	if searchRes != mongo.ErrNoDocuments {
		return nil, fmt.Errorf("Deck \"%s\" already exists", input.File.Filename)
	}

	// map the GraphQL input to the model
	deck := model.Deck{
		Subject:   input.Subject,
		Module:    input.Module,
		ModuleAlt: input.ModuleAlt,
		Examiners: input.Examiners,
		Language:  input.Language,
		Semester:  input.Semester,
		Year:      input.Year,
		Hash:      encodedHash,
		IsValid:   false,
	}

	// insert deck
	_, err := cardDecks.InsertOne(context.Background(), &deck)
	if err != nil {
		return nil, err
	}

	// write file to storage
	deckfilesPath := "./deckfiles/"
	deckFilename := encodedHash + filepath.Ext(input.File.Filename)
	destFile, err := os.Create(deckfilesPath + deckFilename)
	if err != nil {
		return nil, err
	}
	defer destFile.Close()

	_, err = io.Copy(destFile, fileBuf)
	if err != nil {
		return nil, err
	}

	err = destFile.Sync()
	if err != nil {
		return nil, err
	}

	return &deck, nil
}

// DeleteDeck is the resolver for the deleteDeck field.
func (r *mutationResolver) DeleteDeck(ctx context.Context, hash string) (*string, error) {
	tokenString, ok := ctx.Value("jwt").(string)
	if !ok || tokenString == "" {
		return nil, fmt.Errorf("missing JWT token")
	}

	// Validate JWT token
	err := VerifyToken(tokenString)
	if err != nil {
		return nil, fmt.Errorf("invalid JWT token: %v", err)
	}

	cardDecks := r.DB.Collection("cardDecks")
	filter := bson.D{{Key: "hash", Value: hash}}
	res, _ := cardDecks.DeleteOne(ctx, filter)
	if res.DeletedCount == 0 {
		return nil, fmt.Errorf("Nothing found to be deleted. Hash: %s", hash)
	}

	// remove deck from storage
	deckfilesPath := "./deckfiles/"
	deckfiles, err := filepath.Glob(deckfilesPath + hash + ".*")
	if err != nil {
		return nil, err
	}
	err = os.Remove(deckfiles[0])
	if err != nil {
		return nil, err
	}

	return &hash, nil
}

// SetValid is the resolver for the setValid field.
func (r *mutationResolver) SetValid(ctx context.Context, hash string) (*string, error) {
	tokenString, ok := ctx.Value("jwt").(string)
	if !ok || tokenString == "" {
		return nil, fmt.Errorf("missing JWT token")
	}

	// Validate JWT token
	err := VerifyToken(tokenString)
	if err != nil {
		return nil, fmt.Errorf("invalid JWT token: %v", err)
	}

	cardDecks := r.DB.Collection("cardDecks")
	filter := bson.D{{Key: "hash", Value: hash}}
	update := bson.D{{Key: "isValid", Value: true}}
	res := cardDecks.FindOneAndUpdate(ctx, filter, update)
	if res.Err() != nil {
		return nil, res.Err()
	}
	return &hash, nil
}

// Decks is the resolver for the decks field.
func (r *queryResolver) Decks(ctx context.Context) ([]*model.Deck, error) {
	cardDecks := r.DB.Collection("cardDecks")

	filter := bson.D{{}}
	cursor, searchErr := cardDecks.Find(context.Background(), filter)
	if searchErr != nil {
		return nil, searchErr
	}
	defer cursor.Close(context.Background())

	var decks []*model.Deck
	for cursor.Next(context.Background()) {
		var deck *model.Deck
		if err := cursor.Decode(&deck); err != nil {
			return nil, err
		}
		decks = append(decks, deck)
	}
	if err := cursor.Err(); err != nil {
		return nil, err
	}

	return decks, nil
}

// VerifyToken validates the JWT token
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

// Mutation returns MutationResolver implementation.
func (r *Resolver) Mutation() MutationResolver { return &mutationResolver{r} }

// Query returns QueryResolver implementation.
func (r *Resolver) Query() QueryResolver { return &queryResolver{r} }

type mutationResolver struct{ *Resolver }
type queryResolver struct{ *Resolver }

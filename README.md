# cards
Database for Anki Decks with reviewer functionality in the future

## todo
- [ ] `server/graph/schema.resolvers.go` => handle file upload
- [ ] `tools/converter.py` => extract data from anki .colpkg files and make accessible for reviewer

## dev
1. get `mongodb` package and start the service
2. in `server/` start the API endpoint via `go run server.go`
3. `flutter run -d web-server`
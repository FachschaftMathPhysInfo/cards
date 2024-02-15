# cards
Database for Anki Decks with reviewer functionality in the future

## todo
- [x] `server/graph/schema.resolvers.go` => handle file upload
- [ ] kerberos authentication
    - [ ] admin view
- [ ] `lib/modules/deck_selection_menu.dart` => file download: still not taking the new filename
- [ ] search bar
- [ ] `lib/modules/create_deck_dialog.dart` => language selection

## dev
1. get `mongodb` package and start the service
2. in `server/` start the API endpoint via `go run server.go`
3. `flutter run -d web-server`

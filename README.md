# cards
Database for Anki Decks with reviewer functionality in the future

## todo
- [x] `server/graph/schema.resolvers.go` => handle file upload
- [ ] kerberos authentication
    - [ ] admin view
- [x] `lib/modules/deck_selection_menu.dart` => file download: still not taking the new filename
- [ ] search bar
- [ ] `lib/modules/create_deck_dialog.dart` => language selection
- [ ] `lib/modules/create_deck_dialog.dart` => field validation currently updates after a file was uploaded and not on text entry, which is bad => file upload currently has to be the last thing to do for the validation to work "properly"...

## dev
1. get `mongodb` package and start the service
2. in `server/` start the API endpoint via `go run server.go`
3. `flutter run -d web-server`

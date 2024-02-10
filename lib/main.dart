import 'package:cards/modules/deck_selection_menu.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:cards/constants.dart' as c;

void main() {
  runApp(const Cards());
}

ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(cache: GraphQLCache(), link: HttpLink(c.GraphQL.httpLink)));

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: const MaterialApp(title: 'Cards', home: DeckSelectionMenu()),
    );
  }
}

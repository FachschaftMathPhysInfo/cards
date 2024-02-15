import 'package:cards/pages/deck_selection_menu.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logging/logging.dart';
import 'package:cards/constants.dart' as c;

final logflob = Logger("CardsLogger");

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
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

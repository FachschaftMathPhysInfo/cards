import 'package:cards/views/colored_icon_button.dart';
import 'package:cards/views/deck_table_title.dart';
import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;
import 'package:graphql_flutter/graphql_flutter.dart';

class DeckSelectionMenu extends StatelessWidget {
  const DeckSelectionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("dibsel"),
        ),
        body: Query(
            options: QueryOptions(document: gql(c.GraphQL.fetchDecks)),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (result.data == null) {
                return const Center(
                  child: Text(c.Strings.nothingFound),
                );
              }

              final decks = result.data!["decks"];
              return SingleChildScrollView(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: DeckTableTitle(text: c.Strings.module)),
                    DataColumn(label: DeckTableTitle(text: c.Strings.prof)),
                    DataColumn(label: DeckTableTitle(text: c.Strings.semester)),
                    DataColumn(label: DeckTableTitle(text: c.Strings.size)),
                    DataColumn(label: DeckTableTitle(text: c.Strings.options)),
                  ],
                  rows: decks.map((deck) {
                    return DataRow(cells: [
                      DataCell(Text(deck["module"].toString())),
                      DataCell(Text(deck["prof"].toString())),
                      DataCell(Text(deck["semester"].toString())),
                      DataCell(Text(deck["size"].toString())),
                      DataCell(Row(
                        children: [
                          ColoredIconButton(
                              Icon(Icons.download), c.Colors.orange, () {})
                        ],
                      ))
                    ]);
                  }).toList(),
                ),
              );
            }));
  }
}

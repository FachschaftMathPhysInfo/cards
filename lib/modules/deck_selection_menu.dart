import 'package:cards/views/colored_icon_button.dart';
import 'package:cards/views/deck_table_title.dart';
import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;
import 'package:graphql_flutter/graphql_flutter.dart';

class DeckSelectionMenu extends StatelessWidget {
  const DeckSelectionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("dibsel"),
          ),
          body: Query(
              options: QueryOptions(document: gql(c.GraphQL.fetchDecks)),
              builder: (QueryResult result, {fetchMore, refetch}) {
                if (result.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (result.hasException) {
                  return const Center(
                    child: Text(c.Strings.error),
                  );
                }

                final List<Map<String, dynamic>> decks =
                    List<Map<String, dynamic>>.from(result.data!["decks"]);

                if (decks.isEmpty) {
                  return const Center(
                    child: Text(c.Strings.nothingFound),
                  );
                }

                return SingleChildScrollView(
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(label: DeckTableTitle(text: c.Strings.module)),
                      DataColumn(label: DeckTableTitle(text: c.Strings.prof)),
                      DataColumn(
                          label: DeckTableTitle(text: c.Strings.semester)),
                      DataColumn(label: DeckTableTitle(text: c.Strings.size)),
                      DataColumn(
                          label: DeckTableTitle(text: c.Strings.language)),
                      DataColumn(
                          label: DeckTableTitle(text: c.Strings.options)),
                    ],
                    rows: decks
                        .map((deck) => DataRow(cells: [
                              DataCell(Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(deck["module"]?.toString() ?? ""),
                                  if (deck["moduleAlt"] != null) ...[
                                    Text(
                                      deck["moduleAlt"].toString(),
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ]
                                ],
                              )),
                              DataCell(
                                  Text(deck["examiners"]?.toString() ?? "")),
                              DataCell(Text(
                                  (deck["semester"]?.toString() ?? "") +
                                      (deck["year"]?.toString() ?? ""))),
                              DataCell(Text(deck["size"]?.toString() ?? "")),
                              DataCell(
                                  Text(deck["language"]?.toString() ?? "")),
                              DataCell(Row(
                                children: [
                                  ColoredIconButton(Icon(Icons.download),
                                      c.Colors.orange, () {})
                                ],
                              ))
                            ]))
                        .toList(),
                  ),
                );
              })),
    );
  }
}

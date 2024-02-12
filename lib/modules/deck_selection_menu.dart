// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:cards/modules/create_deck_dialog.dart';
import 'package:cards/views/colored_icon_button.dart';
import 'package:cards/views/deck_table_title.dart';
import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;
import 'package:graphql_flutter/graphql_flutter.dart';

downloadDeck(url, newFileName) {
  AnchorElement anchorElement = AnchorElement(href: url);
  anchorElement.download = newFileName;
  anchorElement.click();
}

class DeckSelectionMenu extends StatelessWidget {
  const DeckSelectionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Dibsel"),
            actions: [
              IconButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        // ignore: prefer_const_constructors
                        return CreateDeckDialog();
                      }),
                  icon: const Icon(Icons.upload)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.login))
            ],
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

                return Center(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Builder(builder: (context) {
                      return Flexible(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              child: DataTable(
                                columns: const <DataColumn>[
                                  DataColumn(
                                      label: DeckTableTitle(
                                          text: c.Strings.module)),
                                  DataColumn(
                                      label:
                                          DeckTableTitle(text: c.Strings.prof)),
                                  DataColumn(
                                      label: DeckTableTitle(
                                          text: c.Strings.semester)),
                                  DataColumn(
                                      label:
                                          DeckTableTitle(text: c.Strings.size)),
                                  DataColumn(
                                      label: DeckTableTitle(
                                          text: c.Strings.language)),
                                  DataColumn(
                                      label: DeckTableTitle(
                                          text: c.Strings.options)),
                                ],
                                rows: decks
                                    .map((deck) => DataRow(cells: [
                                          DataCell(Row(
                                            children: [
                                              Text(deck["module"]?.toString() ??
                                                  ""),
                                              const SizedBox(width: 10),
                                              Text(
                                                deck["moduleAlt"]?.toString() ??
                                                    "",
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          )),
                                          DataCell(Text(
                                              deck["examiners"]?.toString() ??
                                                  "")),
                                          DataCell(Text(
                                              (deck["semester"]?.toString() ??
                                                      "") +
                                                  (deck["year"]?.toString() ??
                                                      ""))),
                                          DataCell(Text(
                                              deck["size"]?.toString() ?? "")),
                                          DataCell(Text(
                                              deck["language"]?.toString() ??
                                                  "")),
                                          DataCell(Row(
                                            children: [
                                              ColoredIconButton(
                                                  const Icon(Icons.download),
                                                  c.Colors.orange, () {
                                                String uuid = deck["_id"];
                                                String module = deck["module"];
                                                String subject =
                                                    deck["subject"];
                                                String filePath =
                                                    c.GraphQL.deckStoragePath;
                                                downloadDeck(
                                                    "$filePath/$uuid.apkg",
                                                    "$module-$subject");
                                              })
                                            ],
                                          ))
                                        ]))
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              })),
    );
  }
}

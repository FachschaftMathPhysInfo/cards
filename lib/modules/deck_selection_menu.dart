// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:cards/main.dart';
import 'package:cards/modules/create_deck_dialog.dart';
import 'package:cards/views/deck_table_title.dart';
import 'package:cards/views/simple_alert.dart';
import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:path/path.dart' as path;

downloadDeck(url, newFileName) {
  AnchorElement anchorElement = AnchorElement(href: url);
  anchorElement.download = "$newFileName${path.extension(url)}";
  anchorElement.click();
}

class DeckSelectionMenu extends StatefulWidget {
  const DeckSelectionMenu({super.key});

  @override
  State<DeckSelectionMenu> createState() => _DeckSelectionMenuState();
}

class _DeckSelectionMenuState extends State<DeckSelectionMenu> {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Dibsel"),
            actions: [
              IconButton(
                  onPressed: () => showDialog(
                      barrierDismissible: false,
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
                  logflob.shout(result.exception!.toString());
                  return const Center(
                    child: Text(c.Strings.error),
                  );
                }

                final List<Map<String, dynamic>> decks =
                    List<Map<String, dynamic>>.from(result.data!["decks"]);

                if (decks.isEmpty) {
                  return const Center(
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(c.Strings.nothingFound)),
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
                              child: DeckTable(
                                decks: decks,
                                refetchQuery: () {
                                  setState(() {
                                    refetch!();
                                  });
                                },
                              )),
                        ),
                      );
                    }),
                  ),
                );
              })),
    );
  }
}

class DeckTable extends StatefulWidget {
  final List<Map<String, dynamic>> decks;
  final Function refetchQuery;
  const DeckTable({super.key, required this.decks, required this.refetchQuery});

  @override
  State<DeckTable> createState() => _DeckTableState();
}

class _DeckTableState extends State<DeckTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(label: DeckTableTitle(text: c.Strings.module)),
          DataColumn(label: DeckTableTitle(text: c.Strings.prof)),
          DataColumn(label: DeckTableTitle(text: c.Strings.semester)),
          DataColumn(label: DeckTableTitle(text: c.Strings.size)),
          DataColumn(label: DeckTableTitle(text: c.Strings.language)),
          DataColumn(label: DeckTableTitle(text: c.Strings.options)),
        ],
        rows: widget.decks
            .map((deck) => DataRow(cells: [
                  DataCell(Row(
                    children: [
                      Text(deck["module"]?.toString() ?? ""),
                      const SizedBox(width: 10),
                      Text(
                        deck["moduleAlt"]?.toString() ?? "",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  )),
                  DataCell(Text(deck["examiners"]?.toString() ?? "")),
                  DataCell(Text(
                      ("${deck["semester"]?.toString() ?? ""} ${deck["year"]?.toString() ?? ""}"))),
                  DataCell(Text(deck["size"]?.toString() ?? "")),
                  DataCell(Text(deck["language"]?.toString() ?? "")),
                  DataCell(Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.download,
                              color: c.Colors.orange),
                          onPressed: () {
                            String hash = deck["hash"];
                            String module = deck["module"];
                            String subject = deck["subject"];
                            String filePath = c.GraphQL.deckStoragePath;
                            downloadDeck(
                                "$filePath/$hash.apkg", "$module-$subject");
                          }),
                      Mutation(
                          options: MutationOptions(
                              document: gql(c.GraphQL.deleteDeck),
                              onCompleted: (dynamic resultData) {
                                widget.refetchQuery();
                                logflob.info(resultData.toString());
                              },
                              onError: (OperationException? error) {
                                logflob.shout(error.toString());
                              }),
                          builder: (RunMutation deleteDeckMutation,
                              QueryResult? deleteResult) {
                            deleteDeck() {
                              deleteDeckMutation(
                                  {"hash": deck["hash"].toString()});
                            }

                            return IconButton(
                                onPressed: () {
                                  simpleAlert(context,
                                      "${deck["module"]} ${c.Strings.goingToBeDeleted}",
                                      () {
                                    deleteDeck();
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: c.Colors.red,
                                ));
                          })
                    ],
                  ))
                ]))
            .toList(),
      ),
    );
  }
}

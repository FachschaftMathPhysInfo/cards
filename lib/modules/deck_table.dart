import 'package:cards/utils/download_file.dart';
import 'package:flutter/material.dart';
import 'package:cards/main.dart';
import 'package:cards/views/deck_table_title.dart';
import 'package:cards/views/simple_alert.dart';
import 'package:cards/constants.dart' as c;
import 'package:graphql_flutter/graphql_flutter.dart';

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

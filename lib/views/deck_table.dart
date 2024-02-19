import 'package:cards/pages/edit_deck_dialog.dart';
import 'package:cards/utils/download.dart';
import 'package:cards/views/flag.dart';
import 'package:flutter/material.dart';
import 'package:cards/main.dart';
import 'package:cards/views/deck_table_title.dart';
import 'package:cards/views/simple_alert.dart';
import 'package:cards/constants.dart' as c;
import 'package:graphql_flutter/graphql_flutter.dart';

class DeckTable extends StatelessWidget {
  final List<Map<String, dynamic>> decks;
  final Function refetchQuery;
  final Map<String, dynamic>? decodedToken;
  final String emptyText;
  const DeckTable(
      {super.key,
      required this.decks,
      required this.refetchQuery,
      this.decodedToken,
      required this.emptyText});

  @override
  Widget build(BuildContext context) {
    if (decks.isEmpty) {
      return Column(
        children: [
          const SizedBox(height: 20),
          Text(emptyText),
        ],
      );
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(label: DeckTableTitle(text: c.Strings.module)),
          DataColumn(label: DeckTableTitle(text: c.Strings.prof)),
          DataColumn(label: DeckTableTitle(text: c.Strings.semester)),
          // TODO Deck data extraction and display basic information
          // DataColumn(label: DeckTableTitle(text: c.Strings.size)),
          DataColumn(label: DeckTableTitle(text: c.Strings.language)),
          DataColumn(label: DeckTableTitle(text: c.Strings.options)),
        ],
        rows: decks
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

                  // DataCell(Text(deck["size"]?.toString() ?? "")),
                  DataCell(Flag(languageCode: deck["language"])),
                  DataCell(Row(
                    children: [
                      //
                      // Download
                      //
                      IconButton(
                          icon: const Icon(Icons.download,
                              color: c.Colors.orange),
                          onPressed: () {
                            String hash = deck["hash"];
                            String module = deck["module"];
                            String subject = deck["subject"];
                            String filePath = c.GraphQL.deckfilesUrl;
                            download(
                                "$filePath/$hash.apkg", "$module-$subject");
                          }),
                      if (decodedToken != null) ...[
                        //
                        // Edit
                        //
                        IconButton(
                            onPressed: () => showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  // ignore: prefer_const_constructors
                                  return EditDeckDialog(
                                      refetchQuery: refetchQuery,
                                      module: deck["module"],
                                      moduleAlt: deck["moduleAlt"],
                                      subject: deck["subject"],
                                      examiners: deck["examiners"],
                                      semester: deck["semester"],
                                      year: deck["year"],
                                      language: deck["language"],
                                      hash: deck["hash"]);
                                }),
                            icon: const Icon(Icons.edit)),
                        //
                        // Approve
                        //
                        if (!deck["isValid"])
                          Mutation(
                              options: MutationOptions(
                                  document: gql(c.GraphQL.setValid),
                                  onCompleted: (dynamic resultData) {
                                    refetchQuery();
                                    logflob.info(resultData.toString());
                                  },
                                  onError: (OperationException? error) {
                                    logflob.shout(error.toString());
                                  }),
                              builder: (RunMutation setValidMutation,
                                  QueryResult? deleteResult) {
                                setValid() {
                                  setValidMutation(
                                      {"hash": deck["hash"].toString()});
                                }

                                return IconButton(
                                    onPressed: () => setValid(),
                                    icon: const Icon(
                                      Icons.check,
                                      color: c.Colors.blue,
                                    ));
                              }),
                        //
                        // Delete
                        //
                        Mutation(
                            options: MutationOptions(
                                document: gql(c.GraphQL.deleteDeck),
                                onCompleted: (dynamic resultData) {
                                  refetchQuery();
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
                      ]
                    ],
                  ))
                ]))
            .toList(),
      ),
    );
  }
}

import 'package:cards/main.dart';
import 'package:cards/pages/auth_prompt.dart';
import 'package:cards/modules/deck_table.dart';
import 'package:cards/pages/create_deck_dialog.dart';
import 'package:cards/utils/session.dart';
import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;
import 'package:graphql_flutter/graphql_flutter.dart';

class DeckSelectionMenu extends StatefulWidget {
  const DeckSelectionMenu({super.key});

  @override
  State<DeckSelectionMenu> createState() => _DeckSelectionMenuState();
}

class _DeckSelectionMenuState extends State<DeckSelectionMenu> {
  Map<String, dynamic>? decodedToken = getDecodedToken();
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
            document: gql(c.GraphQL.isValidToken),
            variables: {
              "jwtToken": decodedToken != null ? decodedToken!["jwt"] : ""
            }),
        builder: (QueryResult result, {fetchMore, refetch}) {
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
                    if (result.hasException) ...[
                      IconButton(
                          onPressed: () => showDialog(
                              context: context,
                              builder: (context) {
                                // ignore: prefer_const_constructors
                                return AuthPrompt();
                              }),
                          icon: const Icon(Icons.login))
                    ] else ...[
                      Text(decodedToken!["user"]),
                      const SizedBox(width: 20)
                    ]
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
                          List<Map<String, dynamic>>.from(
                              result.data!["decks"]);

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
                                constraints:
                                    const BoxConstraints(maxWidth: 1200),
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: DeckTable(
                                      decodedToken: decodedToken,
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
        });
  }
}

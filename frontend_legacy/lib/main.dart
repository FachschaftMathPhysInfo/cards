import 'package:cards/pages/deck_selection_menu.dart';
import 'package:cards/utils/cookie.dart';
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
  setTokenCookieFromUrl();
  setThemeCookie();
  runApp(const Cards());
}

ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(cache: GraphQLCache(), link: HttpLink(c.GraphQL.graphqlUrl)));

class Cards extends StatelessWidget {
  static final ValueNotifier<ThemeMode> theme = ValueNotifier(
      getValueOfCookie("theme") == "dark" ? ThemeMode.dark : ThemeMode.light);
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: theme,
      builder: (_, ThemeMode currentTheme, __) {
        return GraphQLProvider(
          client: client,
          child: MaterialApp(
              title: c.Strings.appName,
              theme: c.Themes.light,
              darkTheme: c.Themes.dark,
              themeMode: currentTheme,
              home: const DeckSelectionMenu()),
        );
      },
    );
  }
}

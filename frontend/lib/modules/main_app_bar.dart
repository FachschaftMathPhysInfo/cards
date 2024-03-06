import 'package:cards/main.dart';
import 'package:cards/pages/create_deck_dialog.dart';
import 'package:cards/utils/cookie.dart';
import 'package:cards/utils/session.dart';
import 'package:cards/utils/web.dart';
import 'package:cards/views/icon_text_item.dart';
import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Map<String, dynamic>? decodedToken;
  const MainAppBar({super.key, required this.decodedToken});

  void _toggleTheme() {
    Cards.theme.value =
        Cards.theme.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    setThemeCookie(Cards.theme.value == ThemeMode.light ? "light" : "dark");
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          SizedBox(
              width: 30,
              height: 30,
              child: Image.network("assets/assets/logo.png")),
          const SizedBox(width: 10),
          const Text(c.Strings.appName),
        ],
      ),
      actions: [
        ValueListenableBuilder<ThemeMode>(
            valueListenable: Cards.theme,
            builder: (_, ThemeMode currentTheme, __) {
              return IconButton(
                tooltip: currentTheme == ThemeMode.dark
                    ? c.Strings.lightMode
                    : c.Strings.darkMode,
                onPressed: _toggleTheme,
                icon: Icon(currentTheme == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode),
              );
            }),
        IconButton(
            tooltip: c.Strings.contributeDeck,
            onPressed: () => showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  // ignore: prefer_const_constructors
                  return CreateDeckDialog();
                }),
            icon: const Icon(Icons.upload)),
        PopupMenuButton(
            tooltip: c.Strings.menu,
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                      onTap: () => openUrl(c.Strings.githubUrl, newTab: true),
                      child: const IconTextItem(
                          icon: Icon(Icons.code), text: c.Strings.github)),
                  const PopupMenuDivider(),
                  PopupMenuItem(
                      onTap: decodedToken == null ? login : logout,
                      child: IconTextItem(
                          icon: Icon(decodedToken == null
                              ? Icons.login
                              : Icons.logout),
                          text: decodedToken == null
                              ? c.Strings.login
                              : c.Strings.logout))
                ]),
        if (decodedToken != null) ...[
          Text(c.Strings.loggedInAs + decodedToken!["user"]),
        ],
        const SizedBox(width: 20)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

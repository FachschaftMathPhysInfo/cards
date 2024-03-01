import 'package:cards/main.dart';
import 'package:cards/views/deck_table.dart';
import 'package:cards/views/simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;

class DecksWithSearch extends StatefulWidget {
  final List<Map<String, dynamic>> decks;
  final Function refetchQuery;
  final Map<String, dynamic>? decodedToken;
  const DecksWithSearch(
      {super.key,
      required this.decks,
      required this.refetchQuery,
      required this.decodedToken});

  @override
  State<DecksWithSearch> createState() => _DecksWithSearch();
}

class _DecksWithSearch extends State<DecksWithSearch> {
  List<Map<String, dynamic>> unauthorizedDecks = [];
  List<Map<String, dynamic>> filteredDecks = [];

  @override
  void initState() {
    super.initState();
    for (Map<String, dynamic> deck in widget.decks) {
      if (deck["isValid"] == true) {
        filteredDecks.add(deck);
      } else {
        unauthorizedDecks.add(deck);
      }
    }
  }

  void filterDecks(String pattern) {
    setState(() {
      filteredDecks = widget.decks.where((deck) {
        final module = deck["module"]?.toString() ?? "";
        final moduleAlt = deck["moduleAlt"]?.toString() ?? "";
        final subject = deck["subject"]?.toString() ?? "";
        final examiners = deck["examiners"]?.toString() ?? "";
        final semesterYear =
            ("${deck["semester"]?.toString() ?? ""} ${deck["year"]?.toString() ?? ""}");
        final size = deck["size"]?.toString() ?? "";
        final language = deck["language"]?.toString() ?? "";
        final isValid = deck["isValid"] ?? false;

        return (module.contains(pattern) ||
                moduleAlt.contains(pattern) ||
                subject.contains(pattern) ||
                examiners.contains(pattern) ||
                semesterYear.contains(pattern) ||
                size.contains(pattern) ||
                language.contains(pattern)) &&
            isValid;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: Cards.theme,
      builder: (_, ThemeMode currentTheme, __) {
        Color containerColor = currentTheme == ThemeMode.light
            ? Colors.white
            : const ColorScheme.dark().background;

        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              if (widget.decodedToken != null) ...[
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                            color: containerColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                c.Strings.adminPanel,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            DeckTable(
                              decks: unauthorizedDecks,
                              refetchQuery: widget.refetchQuery,
                              decodedToken: widget.decodedToken,
                              emptyText: c.Strings.nothingToDo,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20)
                  ],
                )
              ],
              Container(
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    SimpleTextField(
                      onChanged: (pattern) => filterDecks(pattern!),
                      label: c.Strings.filter,
                      hint: c.Strings.moduleAltHelper,
                      icon: const Icon(Icons.search),
                      autofocus: true,
                    ),
                    DeckTable(
                      decks: filteredDecks,
                      refetchQuery: widget.refetchQuery,
                      decodedToken: widget.decodedToken,
                      emptyText: c.Strings.nothingFound,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

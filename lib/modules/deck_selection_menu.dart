import 'package:cards/views/colored_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:cards/constants.dart' as c;

class DeckSelectionMenu extends StatelessWidget {
  final List<Map<String, dynamic>> deckData;
  const DeckSelectionMenu({required this.deckData, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("dibsel"),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Expanded(
                child: Text(
                  'Modul',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Prof.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Semester',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Karten',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Optionen',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
          rows: deckData.map((deck) {
            return DataRow(cells: [
              DataCell(Text(deck["module"].toString())),
              DataCell(Text(deck["prof"].toString())),
              DataCell(Text(deck["semester"].toString())),
              DataCell(Text(deck["size"].toString())),
              DataCell(Row(
                children: [
                  ColoredIconButton(Icon(Icons.download), c.Colors.orange)
                ],
              ))
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

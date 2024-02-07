import 'package:cards/modules/deck_selection_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cards/database.dart' as d;

void main() => runApp(const Cards());

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      title: 'Cards',
      home: FutureBuilder<List<Map<String, dynamic>>>(
        future: d.Database.fetchData(), // Function to fetch data from MongoDB
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show loading indicator while data is being fetched
          } else if (snapshot.hasError) {
            return Text(
                'Error: ${snapshot.error}'); // Show error message if there's an error
          } else {
            return DeckSelectionMenu(
                deckData:
                    snapshot.data!); // Pass fetched data to the table widget
          }
        },
      ),
    );
  }
}

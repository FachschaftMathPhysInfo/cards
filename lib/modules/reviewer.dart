import 'package:cards/views/colored_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:cards/views/flippable_card.dart';
import 'package:cards/constants.dart' as c;

class Flashcards extends StatefulWidget {
  const Flashcards({super.key});

  @override
  State<Flashcards> createState() => _FlashcardsState();
}

class _FlashcardsState extends State<Flashcards> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("data"),
            SizedBox(height: 10),
            FlippableCard("front", "back"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColoredIconButton(Icon(Icons.cancel), c.Colors.red),
                Flexible(
                    child: Center(
                  child: Text("20 out 100"),
                )),
                ColoredIconButton(Icon(Icons.check), c.Colors.blue)
              ],
            )
          ],
        ),
      ),
    );
  }
}

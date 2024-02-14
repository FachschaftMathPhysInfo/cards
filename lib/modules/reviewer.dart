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
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("data"),
            const SizedBox(height: 10),
            const FlippableCard("front", "back"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColoredIconButton(
                    const Icon(Icons.cancel), c.Colors.red, () {}),
                const Flexible(
                    child: Center(
                  child: Text("20 out 100"),
                )),
                ColoredIconButton(const Icon(Icons.check), c.Colors.blue, () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}

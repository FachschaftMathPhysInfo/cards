import 'package:flutter/material.dart';
import 'package:cards/views/flippable_card.dart';

class Flashcards extends StatefulWidget {
  const Flashcards({super.key});

  @override
  State<Flashcards> createState() => _FlashcardsState();
}

class _FlashcardsState extends State<Flashcards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: FlippableCard("test", "test")),
    );
  }
}

import 'package:cards/modules/flashcards.dart';
import 'package:flutter/material.dart';

class CardSelectionMenu extends StatefulWidget {
  const CardSelectionMenu({super.key});

  @override
  State<CardSelectionMenu> createState() => _CardSelectionMenuState();
}

class _CardSelectionMenuState extends State<CardSelectionMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flashcards(),
    );
  }
}

import 'package:flutter/material.dart';

class DeckTableTitle extends StatelessWidget {
  final String text;
  const DeckTableTitle({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        style: const TextStyle(
            fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'modules/card-selection-menu.dart';
import 'modules/flashcards.dart';

void main() => runApp(Cards());

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return const MaterialApp(
      title: 'Cards',
      home: CardSelectionMenu(),
    );
  }
}

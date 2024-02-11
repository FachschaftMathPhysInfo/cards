import 'package:flutter/material.dart';

class Colors {
  Colors._();
  static const Color red = Color(0xFFe74236);
  static const Color turquoiseLight = Color(0xFF9dc8b0);
  static const Color blue = Color(0xFF388bea);
  static const Color turquoiseDark = Color(0xFF54988c);
  static const Color orange = Color(0xFFf29642);
}

class Strings {
  Strings._();
  static const String cardKnown = "Got it!";
  static const String cardNotKnown = "Repeat card.";

  static const String module = "Modul";
  static const String prof = "Prof.";
  static const String semester = "Semester";
  static const String size = "Größe";
  static const String options = "Optionen";

  static const String nothingFound = "Keine Karten gefunden";
}

class GraphQL {
  GraphQL._();
  static const String httpLink = "http://localhost:8080/";

  static const String fetchDecks = """
    query {
      decks {
        module
        moduleAlt
        examiners
        semester
        downloadUrl
      }
    }
  """;
  static const String createDeck = "";
}

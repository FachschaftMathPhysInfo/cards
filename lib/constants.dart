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
  static const String moduleAlt = "Kurzform";
  static const String prof = "Dozent";
  static const String semester = "Semester";
  static const String year = "Jahr";
  static const String size = "Größe";
  static const String language = "Sprache";
  static const String options = "Optionen";
  static const String subject = "Thema";

  static const String nothingFound = "Keine Karten gefunden";
  static const String error =
      "Ein interner Fehler ist aufgetreten.\nBitte kontaktiere <mail@dheidemann.de>.";

  static const String contributeDeck = "Kartendeck einreichen";
  static const String submit = "Einreichen";
  static const String upload = "Datei hochladen";
  static const String wise = "WiSe";
  static const String sose = "SoSe";
  static const String moduleAltHelper = "z.B. AlDa";
  static const String userConstent =
      "Mit dem Klicken auf <Einreichen> erkläre ich mich einverstanden, dass die von mir angegebenen Daten von der Fachschaft MathPhysInfo verarbeitet, und der Allgemeinheit zur Verfügung gestellt werden.";
}

class GraphQL {
  GraphQL._();
  static const String httpLink = "http://localhost:8080/graphql";
  static const String deckStoragePath = "/storage/paths"; // no trailing slash

  static const String fetchDecks = """
    query {
      decks {
        _id
        subject
        module
        moduleAlt
        examiners
        semester
        year
      }
    }
  """;
  static const String createDeck = """
    mutation CreateDeck(\$input: NewDeck!) {
      createDeck(input: \$input) {
        module
      }
    }
  """;
}

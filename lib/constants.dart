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
      "Ugh, ein interner Fehler.\nBitte kontaktiere <root@mathphys.info>.";

  static const String contributeDeck = "Deck einreichen";
  static const String submit = "Einreichen";
  static const String upload = "Datei hochladen";
  static const String wise = "WiSe";
  static const String sose = "SoSe";
  static const String moduleAltHelper = "z.B. AlDa";
  static const String userConstent =
      "Mit dem Klicken auf <Einreichen> erkläre ich mich einverstanden, dass die von mir angegebenen Daten durch die Fachschaft MathPhysInfo der Uni Heidelberg verarbeitet, und der Allgemeinheit zur Verfügung gestellt werden.";

  static const String okay = "Okay";
  static const String yes = "Ja";
  static const String cancel = "Abbrechen";
  static const String discardChanges = "Änderungen verwerfen";
  static const String leaveDialog = "Sicher? Alle Änderungen gehen verloren.";
  static const String uploadSuccessMessage =
      "Danke!\nWir geben das Deck so bald wie möglich frei.";
  static const String goingToBeDeleted = "wird gelöscht!";
}

class GraphQL {
  GraphQL._();
  static const String httpLink = "http://localhost:8080/graphql";
  static const String deckStoragePath =
      "http://localhost:8080/deckfiles"; // no trailing slash

  static const String fetchDecks = """
    query {
      decks {
        subject
        module
        moduleAlt
        examiners
        language
        semester
        year
        hash
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
  static const String deleteDeck = """
    mutation DeleteDeck(\$hash: String!) {
      deleteDeck(hash: \$hash)
    }
  """;
}

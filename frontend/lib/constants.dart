import 'package:flutter/material.dart';

class Colors {
  Colors._();
  static const Color red = Color(0xFFe74236);
  static const Color turquoiseLight = Color(0xFF9dc8b0);
  static const Color blue = Color(0xFF388bea);
  static const Color turquoiseDark = Color(0xFF54988c);
  static const Color orange = Color(0xFFf29642);
  static const Color lightGrey = Color(0xEDEDEDED);
  static const Color darkGrey = Color.fromARGB(255, 32, 32, 32);
}

class Themes {
  static final light = ThemeData(
    scaffoldBackgroundColor: Colors.lightGrey,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    scaffoldBackgroundColor: Colors.darkGrey,
    colorScheme: const ColorScheme.dark(),
    brightness: Brightness.dark,
  );
}

class Strings {
  Strings._();
  static const String appName = "Stapel";

  static const String module = "Modul";
  static const String moduleAlt = "Kurzform";
  static const String prof = "Dozent/-in";
  static const String semester = "Semester";
  static const String year = "Jahr";
  static const String size = "Größe";
  static const String language = "Sprache";
  static const String options = "Optionen";
  static const String subject = "Thema";

  static const String filter = "Filter";
  static const String nothingToDo = "Nichts zu tun";
  static const String adminPanel = "Desch is zu autorisieren";

  static const String nothingFound = "Keine Karten gefunden";
  static const String error =
      "Ugh, ein interner Fehler.\nBitte kontaktiere <root@mathphys.info>.";

  static const String editDeck = "Stapel bearbeiten";
  static const String contributeDeck = "Anki Stapel einreichen";
  static const String submit = "Einreichen";
  static const String save = "Speichern";
  static const String upload = "Datei hochladen";
  static const String wise = "WiSe";
  static const String sose = "SoSe";
  static const String moduleAltHelper = "z.B. LA1";
  static const String submitError = "Alle Felder müssen befüllt sein";
  static const String userConsent =
      "Mit dem Klicken auf <Einreichen> erkläre ich mich einverstanden, dass die von mir angegebenen Daten durch die Fachschaft MathPhysInfo der Uni Heidelberg verarbeitet, und der Allgemeinheit zur Verfügung gestellt werden.";

  static const String okay = "Okay";
  static const String yes = "Ja";
  static const String cancel = "Abbrechen";
  static const String discardChanges = "Änderungen verwerfen";
  static const String leaveDialog = "Sicher? Alle Änderungen gehen verloren.";
  static const String uploadSuccessMessage =
      "Danke!\nWir geben den Stapel so bald wie möglich frei.";
  static const String goingToBeDeleted = "wird gelöscht!";

  static const String login = "Fachschaftslogin";
  static const String logout = "Abmelden";
  static const String loggedInAs = "angemeldet als: ";
  static const String github = "Source Code";
  static const String githubUrl =
      "https://github.com/FachschaftMathPhysInfo/cards";
  static const String darkMode = "Dunkelmodus";
  static const String lightMode = "Hellmodus";
  static const String menu = "Menü";
}

class GraphQL {
  GraphQL._();
  static const String baseUrl =
      "https://${const String.fromEnvironment("API_URL")}";
  static const String graphqlUrl = "$baseUrl/graphql";
  static const String deckfilesUrl = "$baseUrl/deckfiles/";
  static const String loginUrl = "$baseUrl/login/";

  // queries
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
        fileType
        isValid
      }
    }
  """;
  static const String isValidToken = """
    query IsValidToken(\$jwtToken: String!) {
      isValidToken(jwtToken: \$jwtToken)
    }
  """;

  // mutations
  static const String createDeck = """
    mutation CreateDeck(\$input: NewDeck!) {
      createDeck(input: \$input) {
        module
      }
    }
  """;
  static const String updateDeck = """
    mutation UpdateDeck(\$hash: String!, \$input: NewDeck!) {
      updateDeck(hash: \$hash, input: \$input)
    }
  """;
  static const String deleteDeck = """
    mutation DeleteDeck(\$hash: String!) {
      deleteDeck(hash: \$hash)
    }
  """;
  static const String setValid = """
    mutation SetValid(\$hash: String!) {
      setValid(hash: \$hash)
    }
  """;
}

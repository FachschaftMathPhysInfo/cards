import 'dart:developer';
import 'dart:io';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:cards/constants.dart' as c;

class Database {
  static Db? db;
  static final DbCollection decks = db!.collection(c.MongoDB.deckCollection);

  static Future<void> connect() async {
    try {
      db = await Db.create(c.MongoDB.mongoUri);
      await db!.open();
      inspect(db);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> close() async {
    try {
      await db!.close();
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> insert(
      String module, String prof, String semester, int size, File deck) async {
    List<int> deckBytes = await deck.readAsBytes();

    final input = {
      "module": module,
      "prof": prof,
      "semester": semester,
      "size": size,
      "deck": deckBytes
    };

    try {
      await decks.insert(input);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<List<Map<String, dynamic>>> fetchData() async {
    connect();
    var data = await decks.find().toList();
    close();
    return data;
  }
}

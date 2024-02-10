import 'package:mongo_dart/mongo_dart.dart';

class Deck {
  final ObjectId id;
  final String module;
  final String prof;
  final String semester;
  final int size;

  const Deck(
      {required this.id,
      required this.module,
      required this.prof,
      required this.semester,
      required this.size});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'module': module,
      'prof': prof,
      'semester': semester,
      'size': size
    };
  }

  Deck.fromMap(Map<String, dynamic> map)
      : module = map['module'],
        id = map['_id'],
        prof = map['prof'],
        semester = map['semester'],
        size = map['size'];
}

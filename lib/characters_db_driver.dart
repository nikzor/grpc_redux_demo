import 'dart:io';
import 'dart:convert';

import 'generated/rick.pb.dart';

final List<Character> questionsDb = _readDb();

List<Character> _readDb() {
  final jsonString = File('db/characters_db.json').readAsStringSync();
  final List db = jsonDecode(jsonString);

  return db
      .map((entry) => Character()
    ..id = entry['id']
    ..url = entry['url']
    ..name = entry['name'])
      .toList();
}
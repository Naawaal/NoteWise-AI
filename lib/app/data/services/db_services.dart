import 'dart:io' as io;

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBServices {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  static Future<Database> initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = '${documentsDirectory.path}notes.db';
    var db = await openDatabase(path, version: 1, onCreate: _createDB);
    return db;
  }

  static void _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        note TEXT,
        category TEXT,
        date TEXT
      )
    ''');
  }
}

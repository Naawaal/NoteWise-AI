import 'dart:io' as io;

import 'package:note_wise_ai/app/data/models/add_note_model.dart';
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

  Future<AddNoteModel> addNote(AddNoteModel addNoteModel) async {
    final db = await database;
    await db.insert('notes', addNoteModel.toJson());
    return addNoteModel;
  }

  Future<List<AddNoteModel>> getNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> notes = await db.query('notes');
    return List.generate(
      notes.length,
      (index) => AddNoteModel(
        id: notes[index]['id'],
        title: notes[index]['title'],
        note: notes[index]['note'],
        category: notes[index]['category'],
        date: notes[index]['date'],
      ),
    );
  }
}

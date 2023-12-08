import 'package:note_wise_ai/app/data/models/add_note_category_model.dart';
import 'package:note_wise_ai/app/data/models/add_note_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBServices {
  // It's a static property that ensures there's only one instance of
  // DBServices class throughout the app (a Singleton pattern)
  static final DBServices instance = DBServices._privateConstructor();

  static Database? _database;

  // Private constructor
  DBServices._privateConstructor();

  // Get Database Method
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();

    return _database!;
  }

  // Initialize Database Method
  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'notes_database.db');
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );

    return db;
  }

  // Create Database Method
  Future<void> _createDatabase(Database db, int version) async {
    db.execute('''
      CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        note TEXT,
        category TEXT,
        date TEXT
      )
    ''');
  }

  // Create Category Table Method
  Future<void> createTagTable(Database db) async {
    await db.execute('''
    CREATE TABLE tags(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL
    )
  ''');
  }

  Future<int> insertCategory(AddNoteCategoryModel addNoteCategoryModel) async {
    final Database db = await database;
    return await db.insert(
      'category',
      addNoteCategoryModel.toMap(),
    );
  }

  Future<int> insertNote(AddNoteModel addNoteModel) async {
    final Database db = await database;
    return await db.insert(
      'notes',
      addNoteModel.toMap(),
    );
  }

  Future<List<AddNoteModel>> getNotes() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(
      maps.length,
      (index) => AddNoteModel(
        id: maps[index]['id'],
        title: maps[index]['title'],
        note: maps[index]['note'],
        category: maps[index]['category'],
        date: maps[index]['date'],
      ),
    );
  }

  Future<List<AddNoteCategoryModel>> getCategories() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('category');
    return List.generate(
      maps.length,
      (index) => AddNoteCategoryModel(
        id: maps[index]['id'],
        name: maps[index]['name'],
      ),
    );
  }

  Future<void> updateNote(
    AddNoteModel addNoteModel,
  ) async {
    final Database db = await database;
    await db.update(
      'notes',
      addNoteModel.toMap(),
      where: 'id = ?',
      whereArgs: [addNoteModel.id],
    );
  }

  Future<void> deleteNote(int id) async {
    final Database db = await database;
    await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

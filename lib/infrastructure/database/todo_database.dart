import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodoDatabase {
  /// This field
  final _logTag = 'TodoDatabaseTodoDatabase -> ';
  final _databaseName = 'todo.db';

  static final instance = TodoDatabase._privateConstructor();

  TodoDatabase._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    return openDatabase(
      join(databasePath, _databaseName),
      version: 1,
      onCreate: _onCreateDatabase,
      onUpgrade: _onUpgradeDatabase,
      singleInstance: true,
    );
  }

  Future<void> _onCreateDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        isDone INTEGER NOT NULL DEFAULT 0,
        dueDate TEXT,
        priority INTEGER NOT NULL DEFAULT 0
      )
    ''');
  }

  Future<void> _onUpgradeDatabase(Database db, int oldVersion, int newVersion,) async {

  }

}
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
        createAt TEXT,
        priority INTEGER NOT NULL DEFAULT 0
      )
    ''');
  }

  Future<void> _onUpgradeDatabase(Database db, int oldVersion, int newVersion,) async {
    ///TODO: Implement on database upgrade logic
  }

  Future<int> insertTodo(Map<String, dynamic> todo) async {
    final db = await database;
    return await db.insert('todos', todo);
  }

  Future<int> updateTodo(int? id, Map<String, dynamic> todo) async {
    final db = await database;
    return await db.update('todos', todo, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteTodo(int id) async {
    final db = await database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  Future<Map<String, dynamic>?> getTodoById(int id) async {
    final db = await database;
    final results = await db.query('todos', where: 'id = ?', whereArgs: [id]);
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> getAllTodos() async {
    final db = await database;
    return await db.query('todos');
  }

  Future<List<Map<String, dynamic>>> getPaginatedTodos(int limit, int offset) async {
    final db = await database;
    return await db.query('todos', limit: limit, offset: offset);
  }

}
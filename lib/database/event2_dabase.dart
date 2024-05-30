import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Event2Database {
  static final Event2Database _instance = Event2Database._internal();
  static Database? _database;

  factory Event2Database() {
    return _instance;
  }

  Event2Database._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'event2database.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE events(
        id INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT,
        time TEXT,
        date TEXT,
        selectedCommunity TEXT
      )
    ''');
  }

  Future<int> addEvent2(
    String name,
    String description,
    String time,
    String date,
    String selectedCommunity,
  ) async {
    final db = await database;
    return await db.insert(
      'events',
      {
        'name': name,
        'description': description,
        'time': time,
        'date': date,
        'selectedCommunity': selectedCommunity,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getEvents() async {
    final db = await database;
    return await db.query('events');
  }
}

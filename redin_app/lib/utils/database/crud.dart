import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Crud {
  static final Crud _instance = Crud._internal();
  static Database? _database;

  factory Crud() {
    return _instance;
  }

  Crud._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'roulette.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE balance(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount INTEGER NOT NULL
      )
    ''');

    // Insertar saldo inicial
    await db.insert('balance', {'amount': 1000});
  }

  // Metodo para sacar el saldo actual
  Future<int> getBalance() async {
    final db = await database;
    final result = await db.query('balance', limit: 1);
    return result.isNotEmpty ? result.first['amount'] as int : 0;
  }

  // Metodo para actualizar el saldo
  Future<void> updateBalance(int newBalance) async {
    final db = await database;
    await db.update(
      'balance',
      {'amount': newBalance},
      where: 'id = ?',
      whereArgs: [1],
    );
  }
}
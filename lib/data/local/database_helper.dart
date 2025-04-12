import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:deal_app/data/models/deal_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('deals.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE deals (
        id INTEGER PRIMARY KEY,
        imageUrl TEXT,
        commentsCount INTEGER,
        storeName TEXT,
        title TEXT,
        createdAt TEXT,
        type TEXT
      )
    ''');
  }

 

  Future<void> insertDealsBulk(List<DealModel> deals, String type) async {
    final db = await instance.database;
    final batch = db.batch();

    for (final deal in deals) {
      final data = Map<String, dynamic>.from(deal.toJson())..['type'] = type;
      batch.insert(
        'deals',
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  Future<void> deleteDealsByType(String type) async {
    final db = await instance.database;
    await db.delete('deals', where: 'type = ?', whereArgs: [type]);
  }

  Future<List<DealModel>> getDealsByType(String type) async {
    final db = await instance.database;
    final result =
        await db.query('deals', where: 'type = ?', whereArgs: [type]);
    try {
      return result.map((json) {
        return DealModel.fromJson(json);
      }).toList();
    } catch (e, stack) {
      return [];
    }
  }
}

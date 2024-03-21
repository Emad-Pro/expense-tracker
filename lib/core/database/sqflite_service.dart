import 'package:expense_tracker/future/home/data/model/expanse_model_getData.dart';
import 'package:expense_tracker/future/home/data/model/expense_model.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseSqfliteService {
  DatabaseSqfliteService();
  static final DatabaseSqfliteService instance =
      DatabaseSqfliteService._internal();
  static Database? _database;

  DatabaseSqfliteService._internal();

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String dbPath = path.join(await getDatabasesPath(), 'data.db');
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE expenseTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        description TEXT ,
        amount TEXT,
        categories TEXT,
        time TEXT,
        date TEXT
      )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  Future<List<Map<String, dynamic>>> getData(String query) async {
    Database db = await instance.database;
    return await db.rawQuery(query);
  }

  Future<List<ExpanseModelGetData>> getAllData() async {
    List<Map<String, dynamic>> expenseMap =
        await getData('SELECT * FROM expenseTable');
    return expenseMap.map((map) => ExpanseModelGetData.fromMap(map)).toList();
  }

  Future<int> addData(ExpanseModel expanseModel) async {
    Database db = await instance.database;
    return await db.insert(
      'expenseTable',
      expanseModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateData(ExpanseModelGetData expanseModelGetData) async {
    Database db = await instance.database;
    return await db.update('expenseTable', expanseModelGetData.toMap(),
        where: 'id = ?', whereArgs: [1]);
  }

  Future<int> deleteData(int id) async {
    Database db = await instance.database;
    return await db.delete('expenseTable', where: 'id = ?', whereArgs: [id]);
  }
}

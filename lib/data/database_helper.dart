import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:test_app/models/user.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app/models/todo.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._();
  static final DatabaseHelper db = DatabaseHelper._();

  static Database _db;
  static final _tableName = "user";

  Future<Database> get database async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
//    元コード
//    String path = join(documentDirectory.path, "data_flutter.db");
//    変更コード
    String path = join(documentDirectory.path, "flutter.db");
    // Only copy if the database doesn't exist
    //if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){
    // Load database from asset and copy
    ByteData data = await rootBundle.load(join('data', 'flutter.db'));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Save copied asset to documents
    await new File(path).writeAsBytes(bytes);
    //}

    var ourDb = await openDatabase(path);
    return ourDb;
  }
  createUser(User user) async {
    final db = await database;
    var res = await db.insert(_tableName, user.toMap());
    return res;
  }

  getAllUsers() async {
    final db = await database;
    var res = await db.query(_tableName);
    List<User> list =
    res.isNotEmpty ? res.map((c) => User.fromMap(c)).toList() : [];
    return list;
  }

  updateUser(User user) async {
    final db = await database;
    var res  = await db.update(
        _tableName,
        user.toMap(),
        where: "id = ?",
        whereArgs: [user.id]
    );
    return res;
  }

  deleteUser(String id) async {
    final db = await database;
    var res = db.delete(
        _tableName,
        where: "id = ?",
        whereArgs: [id]
    );
    return res;
  }
}
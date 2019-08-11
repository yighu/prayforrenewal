library flutter_app.database.database_hepler;

import 'dart:async';
import 'dart:io' as io;
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_app/database/model/user.dart';
import 'package:flutter_app/database/model/pray.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "f2f.db");
    if(io.FileSystemEntity.typeSync(path)==io.FileSystemEntityType.file){

    //  await new File(path).deleteSync(recursive: true);
    }
    if(io.FileSystemEntity.typeSync(path)==io.FileSystemEntityType.notFound){
      ByteData data=await rootBundle.load(join('assets','f2f.db'));
      List<int> bytes=data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, dob TEXT)");
  }

  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toMap());
    return res;
  }

  Future<List<User>> getUser() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    List<User> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user =
      new User(list[i]["firstname"], list[i]["lastname"], list[i]["dob"]);
      user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    //print(employees.length);
    return employees;
  }


  Future<Pray> getPray(int id,String version) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('select * from pray where bky="$version" and id=$id');

    Pray pray;
    for (int i = 0; i < list.length; i++) {
      pray =
      new Pray(list[i]["ptxt"], list[i]["pref"], list[i]["pcmt"],list[i]["ctxt"], list[i]["cref"], list[i]["ccmt"],list[i]["rtxt"], list[i]["rref"], list[i]["rcmt"],list[i]["ttxt"], list[i]["tref"], list[i]["tcmt"],list[i]["itxt"], list[i]["iref"], list[i]["icmt"],list[i]["atxt"], list[i]["aref"], list[i]["acmt"],list[i]["ntxt"], list[i]["nref"], list[i]["ncmt"],list[i]["ltxt"], list[i]["lref"], list[i]["lcmt"],list[i]["bky"], list[i]["bnm"]);
      pray.setPrayId(list[i]["id"]);

    }
    return pray;
  }

  Future<int> deleteUsers(User user) async {
    var dbClient = await db;

    int res =
    await dbClient.rawDelete('DELETE FROM User WHERE id = ?', [user.id]);
    return res;
  }

  Future<bool> update(User user) async {
    var dbClient = await db;
    int res =   await dbClient.update("User", user.toMap(),
        where: "id = ?", whereArgs: <int>[user.id]);
    return res > 0 ? true : false;
  }
}
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseHelper{

  static DatabaseHelper? _databaseHelper;
  static Database? _database;
  String _tabloAdi="favoriler";
  String _columnId = "id";
  String _columnIsim = "isim";
  String _columnOrder="order";


  DatabaseHelper._internal();

  factory DatabaseHelper(){
    if(_databaseHelper!=null){
      return _databaseHelper!;

    }else{
      _databaseHelper=DatabaseHelper._internal();
      return _databaseHelper!;
    }
  }

  Future<Database?> _getDatabase() async{
    if(_database == null){
      //db null idi oluşturuldu
      _database = await _initializeDatabase();
      return _database;
    }else{
      //db null değildi var olan kullanıldı
      return _database;
    }
  }
  Future<Database> _initializeDatabase() async {

    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "ogrenci.db");
    print("DB Pathi : "+ path);

// Check if the database exists
    var exists = await databaseExists(path);
    print("Database var mı? "+exists.toString());

    var ogrenciDB = openDatabase(path,version: 1,onCreate: _createDB);
    return ogrenciDB;

// open the database

  }
  Future<void> _createDB(Database db,int version)async{
    print("Veritabanı oluşturuldu");
    await db.execute("CREATE TABLE $_tabloAdi ($_columnId INTEGER PRIMARY KEY AUTOINCREMENT, $_columnIsim TEXT, $_columnOrder INTEGER )");

  }
Future<int> favoriEkle(AsyncSnapshot<dynamic> snapshot) async{
    var db=await _getDatabase();
    var sonuc = await db!.insert(_tabloAdi, snapshot.data!,nullColumnHack: "$_columnId");
    print("favori eklendi"+sonuc.toString());
    return sonuc;
}

}
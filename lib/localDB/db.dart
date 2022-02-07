import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:walkiler/models/credentials.dart';

class DBProvider {
// Crea instancia de la base de datos
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
// Obtiene la ruta donde se almacena la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'Local.db');

// Crea la base de datos
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE Credentials (
	id integer PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	token TEXT
  	)''');
    });
  }

  // Inserta un registro en la base de datos
  Future<int> insertUser(Credentials credential) async {
    final db = await database;
    var raw = await db.rawInsert('INSERT INTO User (name, token) VALUES (?, ?)',
        [credential.name, credential.token]);
    return raw;
  }

  // obtiene un registro de la base de datos
  Future<Credentials> getCredential() async {
    final db = await database;
    var res = await db.query('Credentials');
    return res;
  }
}

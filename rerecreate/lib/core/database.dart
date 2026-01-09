import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase{

  

  static Future<Database> open() async {
    
    final path = join(await getDatabasesPath(), 'imc.db');

    print(" banco: $path");

    return openDatabase(path, version: 1,
    onCreate: (db, version) async {

    await db.execute('''

     CREATE TABLE imc_history (
     
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     massa REAL,
     altura REAL,
     imc REAL,
     data TEXT
     )
     ''');


    }
    
    ,);

  }
}
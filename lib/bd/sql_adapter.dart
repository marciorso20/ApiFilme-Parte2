import 'package:projetofinalapimovie/bd/favoritos.dart';
import 'package:projetofinalapimovie/bd/internal_storage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLAdapter extends InternalStorageAdapter {
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  //criação do banco de dados
  initDB() async {
    String path = join(await getDatabasesPath(), 'favorite_database.db');

    return await openDatabase(path, onCreate: (db, version) {
      return db.execute("CREATE TABLE Favorites(id TEXT PRIMARY KEY)");
    }, version: 1);
  }

  @override
  Future<Favorito> saveFavorite(Favorito favorito) async {
    // TODO: implement saveUser
    final Database db = await database;
    await db.insert('Favorites', favorito.toMap());
    print('Select no Banco de Dados');
  }

  @override
  Future<Favorito> deleteFavorite(int id) async {
    // TODO: implement deleteFavorite
    final Database db = await database;
    await db.delete('Favorites', where: 'id = ?', whereArgs: [id]);
    print('Select removido no Banco de Dados');
  }
}

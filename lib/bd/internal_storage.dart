import 'package:projetofinalapimovie/bd/favoritos.dart';

abstract class InternalStorageAdapter {
  Future<Favorito> saveFavorite(Favorito favorito);
  Future<Favorito> deleteFavorite(int id);
}

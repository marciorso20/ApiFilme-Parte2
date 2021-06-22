import 'package:projetofinalapimovie/api/apifilme.dart';
import 'package:projetofinalapimovie/bd/favoritos.dart';
import 'package:projetofinalapimovie/bd/internal_storage.dart';
import 'package:projetofinalapimovie/bd/sql_adapter.dart';
import 'package:projetofinalapimovie/models/filmes.dart';

class MovieModel {
  Future<Filme> _movie;
  Future<Favorito> _favorito;

  final InternalStorageAdapter internalStorage;

  MovieModel({InternalStorageAdapter internalStorageAdapter})
      : internalStorage = internalStorageAdapter ?? SQLAdapter();

  Future<Filme> get movie => _movie;
  Future<Favorito> get favorito => _favorito;

  fetchFilme() {
    _movie = API().fetchFilme();
  }

  Future<Favorito> saveFavorite(Favorito favorito) {
    return internalStorage.saveFavorite(favorito);
  }

  Future<Favorito> deleteFavorite(int id) {
    internalStorage.deleteFavorite(id);
  }
}

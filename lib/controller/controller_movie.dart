import 'dart:async';

import 'package:projetofinalapimovie/bd/favoritos.dart';
import 'package:projetofinalapimovie/models/filmes.dart';
import 'package:projetofinalapimovie/models/models_movie.dart';

class MovieController {
  final model = MovieModel();

  int get id => model.favorito ?? 0;
  Favorito get favorite => model.favorito ?? Favorito();

  Future<Filme> get movie => model.movie;
  //Future<Favorito> get favorito => model.favorito;

  StreamController<Filme> streamLista = StreamController();

  loadMovie() {
    model.fetchFilme();
    model.movie.then((filme) {
      streamLista.add(filme);
    });
  }

  adicionaFavorite() {
    model.saveFavorite(favorite);
  }

  deleteFavorite() {
    model.deleteFavorite(id);
  }
}

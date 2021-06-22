import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projetofinalapimovie/models/filmes.dart';

class API {
  String _autorizacao = 'api.themoviedb.org';
  String _path = '/3/movie/upcoming';

  Future<Filme> fetchFilme() async {
    final response = await http.get(
      Uri.https(
          _autorizacao, _path, {'api_key': 'a5bc05fb630c9b7fdc560033345fa13e'}),
    );

    if (response.statusCode == 200) {
      return Filme.fromJson(jsonDecode(response.body));
    } else {
      return Future.error("Movie not found");
    }
  }
}

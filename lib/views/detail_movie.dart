import 'package:flutter/material.dart';
import 'package:projetofinalapimovie/controller/controller_movie.dart';
import 'package:projetofinalapimovie/models/filmes.dart';
import 'package:projetofinalapimovie/views/view_movie.dart';

class MovieDetail extends StatefulWidget {
  /*  final Result filme;

  MovieDetail({this.filme}); */
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  bool isFavorite = true;
  Color color;
  final controller = MovieController();

  void favorito() {
    setState(() {
      if (isFavorite) {
        isFavorite = false;
        controller.deleteFavorite();
      } else {
        isFavorite = true;
        controller.adicionaFavorite();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filme = ModalRoute.of(context).settings.arguments as Result;

    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.black,
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w300" + filme.posterPath,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                padding: EdgeInsets.all(15),
                child: Material(
                  color: Colors.black,
                  child: Text(
                    filme.title,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Material(
                      color: Colors.black,
                      child: Text(
                        'Data\n ${filme.releaseDate}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: Material(
                      color: Colors.black,
                      child: Text(
                        'Score\n ${filme.vote_average}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        favorito();
                      },
                      icon: Icon(
                        Icons.star,
                        size: 25.0,
                        color: isFavorite ? Colors.red : Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.black,
                      child: Text(
                        '${filme.overview}',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

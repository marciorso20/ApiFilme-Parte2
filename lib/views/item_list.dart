import 'package:flutter/material.dart';
import 'package:projetofinalapimovie/models/filmes.dart';

class ItemList extends StatelessWidget {
  final String imagem;
  final Result filme;
  ItemList({this.imagem, this.filme});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'detailmovie', arguments: filme);
          },
          child: Image.network(imagem),
        ),
      ),
    );
  }
}

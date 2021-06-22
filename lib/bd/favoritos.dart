class Favorito {
  int id;

  Favorito({this.id});

  Favorito.fromMap(Map<String, dynamic> map) {
    id = map['id'];
  }

  Map<String, dynamic> toMap() {
    return {'id': id};
  }
}

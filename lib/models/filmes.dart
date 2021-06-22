class Filme {
  List<Result> results;

  Filme({this.results});

  factory Filme.fromJson(Map<String, dynamic> json) => Filme(
        results: List<Result>.from(
            json["results"].map((result) => Result.fromJson(result))),
      );
}

class Result {
  String title;
  String posterPath;
  String releaseDate;
  String overview;
  var vote_average;

  Result({
    this.title,
    this.posterPath,
    this.releaseDate,
    this.overview,
    this.vote_average,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json['title'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        overview: json['overview'],
        vote_average: json['vote_average'],
      );
}

import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  int id;
  String title;
  String overview;
  double popularity;
  String posterPath;
  int budget;
  List<dynamic> genres;
  List<dynamic> productionCompanies;
  String releaseDate;
  int revenue;
  int runtime;
  List<String> casts;
  String director;
  String backdropPath;
  double voteAverage;
  Movie.none();
  Movie(
      {this.id,
      this.title,
      this.overview,
      this.popularity,
      this.posterPath,
      this.budget,
      this.genres,
      this.productionCompanies,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.casts,
      this.director,
      this.backdropPath,
      this.voteAverage})
      : assert(id != null);

  factory Movie.fromJson(dynamic json) {
    return Movie(
        id: json['id'],
        title: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        budget: json['budget'],
        genres: json['genres'],
        productionCompanies: json['production_companies'],
        releaseDate: json['release_date'],
        revenue: json['revenue'],
        runtime: json['runtime'],
        casts: [],
        director: "",
        backdropPath: json['backdrop_path'],
        voteAverage: json['vote_average']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['original_title'] = this.title;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['budget'] = this.budget;
    data['genres'] = this.genres;
    data['production_companies'] = this.productionCompanies;
    data['release_date'] = this.releaseDate;
    data['revenue'] = this.revenue;
    data['runtime'] = this.runtime;
    data['cast'] = this.casts;
    data['director'] = this.director;
    data['backdrop_path'] = this.backdropPath;
    data['vote_average'] = this.voteAverage;
    return data;
  }

  List<Object> get props => [id, title];

  @override
  String toString() {
    return '''
  title: $title
  genres $genres
  ''';
  }
}

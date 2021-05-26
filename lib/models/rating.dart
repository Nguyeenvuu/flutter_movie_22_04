import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  int userId;
  int movieId;
  double rating;
  int timeRating;

  Rating({this.userId, this.movieId, this.rating, this.timeRating});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      userId: json['user_id'],
      movieId: json['movie_id'],
      rating: json['rating'],
      timeRating: json['time_rating'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['movie_id'] = this.movieId;
    data['content'] = this.rating;
    data['timestamp'] = this.timeRating;
    return data;
  }

  @override
  String toString() {
    return '''
  user_id: $userId,
  movie_id: $movieId,
  rating: $rating
  ''';
  }

  Rating copyWith({
    int userId,
    int movieId,
    double rating,
    int timeRating,
  }) {
    return Rating(
        userId: userId ?? this.userId,
        movieId: movieId ?? this.movieId,
        rating: rating ?? this.rating,
        timeRating: timeRating ?? this.timeRating);
  }

  @override
  // TODO: implement props
  List<Object> get props => [userId, movieId];
}

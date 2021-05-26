import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RatingEvent extends Equatable {
  String get query => null;
}

// ignore: must_be_immutable
class FetchRatingEvent extends RatingEvent {
  String movieId;
  FetchRatingEvent({@required this.movieId});

  @override
  // TODO: implement props
  List<Object> get props => [query];
}

// ignore: must_be_immutable
class AddRatingEvent extends RatingEvent {
  int movieId;
  int userId;
  int rating;
  AddRatingEvent({
    @required this.movieId,
    @required this.userId,
    @required this.rating,
  });

  @override
  List<Object> get props => [movieId, userId, rating, query];
}

// ignore: must_be_immutable
class UpdateRatingEvent extends RatingEvent {
  int movieId;
  int userId;
  int rating;
  UpdateRatingEvent({
    @required this.movieId,
    @required this.userId,
    @required this.rating,
  });

  @override
  List<Object> get props => [movieId, userId, rating, query];
}

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:movie_app/blocs/rating_bloc/rating_event.dart';
import 'package:movie_app/blocs/rating_bloc/rating_state.dart';

import 'package:movie_app/repositories/rating_repository_server.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingRepositoryServer repository;

  RatingBloc({@required this.repository}) : super(RatingInitialState());

  @override
  Stream<RatingState> mapEventToState(RatingEvent event) async* {
    if (event is FetchRatingEvent) {
      yield RatingLoadingState();
      try {
        Map<String, dynamic> sumRatings =
            await repository.listRatingByMovieId(event.movieId);
        yield RatingLoadedState(sumratings: sumRatings);
      } catch (e) {
        yield RatingErrorState(message: e.toString());
      }
    }
    if (event is AddRatingEvent) {
      try {
        Map<String, dynamic> createRating = await repository.createRating(
          movieId: event.movieId,
          userId: event.userId,
          rating: event.rating,
        );

        if (createRating['HaveRating']) {
          Map<String, dynamic> updateRating = await repository.updateRating(
            movieId: event.movieId,
            userId: event.userId,
            rating: event.rating,
          );
          print(updateRating);
          await Future.delayed(Duration(seconds: 1));
          Map<String, dynamic> sumRatings =
              await repository.listRatingByMovieId('${event.movieId}');

          yield RatingLoadedState(sumratings: sumRatings);
        }
      } catch (e) {
        yield RatingErrorState(message: e.toString());
      }
    }
  }
}

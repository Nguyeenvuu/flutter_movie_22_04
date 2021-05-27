import 'package:movie_app/models/Movie.dart';

import 'package:flutter/material.dart';
import 'package:movie_app/models/User.dart';
import 'package:movie_app/repositories/MovieApiClient.dart';
import 'package:movie_app/ui/screens/MovieDetailPage.dart';
import 'package:movie_app/ui/screens/MoreMoviesPage.dart';

class HomePageBloc {
  void buttonMoreTap(
      BuildContext context, String title, List<int> movies, User user) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MoreMoviesPage(title, movies, user)));
  }

  void movieItemSelected(
      BuildContext context, Movie movie, String listName, User user) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MovieDetailPage(movie, listName, user)));
  }

  List<Future<Movie>> loadMovies(List<int> list_id) {
    return MovieApiClient.loadMovies(list_id);
  }

  Future<Map<String, dynamic>> loadRecommendedMovies(int userId) async {
    // ignore: non_constant_identifier_names
    Map<String, dynamic> res_data =
        await MovieApiClient.loadRecommendedMovies(userId);
    return res_data;
  }

  Future<Map<String, dynamic>> loadRecommendedMoviesNewUser(
      int userId, String favorites) async {
    // ignore: non_constant_identifier_names
    Map<String, dynamic> res_data =
        await MovieApiClient.loadRecommendedMoviesNewUSer(userId, favorites);
    return res_data;
  }

  Future<Map<String, dynamic>> loadRecommendedMoviesByCast(
      String castName) async {
    // ignore: non_constant_identifier_names
    Map<String, dynamic> res_data =
        await MovieApiClient.loadMovieByCast(castName);
    return res_data;
  }

  Future<Map<String, dynamic>> loadRecommendedMoviesByGenres(
      {int userId, String favorites}) async {
    // ignore: non_constant_identifier_names
    Map<String, dynamic> res_data =
        await MovieApiClient.loadRecommendedMoviesNewUSer(userId, favorites);
    return res_data;
  }
}

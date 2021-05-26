import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/models/api_model_online.dart';
import 'package:movie_app/repositories/MovieApiClient.dart';
import 'package:movie_app/ui/screens/MovieDetailPage.dart';
import 'package:movie_app/utils/url_base.dart';

class SearchPageBloc {
  Future<List<int>> searchMovies(String title) async {
    var response = await http.get(movieSearchOnlineUrl(title));
    List<int> result = List<int>();
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Results> movies = ApiResultModel.fromJson(data).results;

      for (var i in movies) {
        result.add(i.id);
      }
      print(result);
      return result;
    } else {
      throw Exception();
    }
  }

  List<Future<Movie>> loadMovies(List<int> list_id) {
    return MovieApiClient.loadMovies(list_id);
  }

  void movieItemSelected(BuildContext context, Movie movie, String listName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MovieDetailPage(movie, listName)));
  }
}

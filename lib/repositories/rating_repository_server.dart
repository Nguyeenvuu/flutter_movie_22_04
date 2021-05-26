import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:movie_app/models/rating.dart';
import 'package:movie_app/utils/url_base.dart';

class RatingRepositoryServer {
  static http.Client httpClient = http.Client();

  Future<List<Rating>> listRatingByMovieId(String movieId) async {
    List<Rating> listRating = List<Rating>();
    String url = baseServerUrl + ratingByMovieIdUrl + '$movieId';
    print(url);
    try {
      http.Response response = await http.get(url);
      List resData = json.decode(response.body);

      if (response.statusCode == 200) {
        resData.forEach((rating) {
          int userid = rating['user'];
          int movieid = rating['movie'];
          double rt = rating['rating'];
          var timeStamp = rating['time_rating'];
          Rating newComment = Rating(
              userId: userid,
              movieId: movieid,
              rating: rt,
              timeRating: timeStamp);
          listRating.add(newComment);
        });
        return listRating;
      } else {
        return List<Rating>();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<Rating>> listRatingByUserId(int userId) async {
    List<Rating> listRating = List<Rating>();
    String url = baseServerUrl + ratingByUserIdUrl + '$userId';
    print(url);
    http.Response response = await http.get(url);
    List resData = json.decode(response.body);

    if (response.statusCode == 200) {
      resData.forEach((rating) {
        int user_id = rating['user'];
        int movieId = rating['movie'];
        double rt = rating['rating'];

        var timeStamp = rating['time_rating'];
        Rating newComment = Rating(
            userId: user_id,
            movieId: movieId,
            rating: rt,
            timeRating: timeStamp);
        listRating.add(newComment);
      });
      return listRating;
    } else {
      return List<Rating>();
    }
  }

  // ignore: missing_return
  Future<Map<String, dynamic>> createRating({
    int userId,
    int movieId,
    int rating,
  }) async {
    print(ratingCreateUrl);

    http.Response response = await http.post(
      ratingCreateUrl,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, int>{
          'user_id': userId,
          'rating': rating,
          'movie_id': movieId,
        },
      ),
    );

    Map<String, dynamic> resData = json.decode(response.body);

    return resData;
  }
  //   {
  //     "user_id": 9,
  //     "rating": 4.5,
  //     "movie_id": 14
  // }

}

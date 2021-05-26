import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/url_base.dart';

class MovieRepositoryServer {
  static http.Client httpClient = http.Client();

  static Future<Movie> fetchMovieByMovieId(dynamic id) async {
    String url = movieDetailOnlineUrl(id);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  /// Hàm trả về danh sách Top 200 phim được gợi ý cho user(Danh sách phim được lấy từ model recommendation trong Bảng recommendations)
  static Future<List<dynamic>> listIdRecommendationMoviesByUserId(
      dynamic userId) async {
    http.Response response = await http.post(recommendationMoviesUrl,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, int>{'user_id': userId}));

    Map<String, dynamic> resData = json.decode(response.body);

    return resData['recommendations'];
  }

  static Future<List<int>> searchMovies(String title) async {
    String url =
        baseApiOnlineUrl + "search/movie?api_key=$api_key&query=$title";
    http.Response response = await http.get(url);

    var data = json.decode(response.body);
    List results = data['results'] as List;
    List<int> listMovieId = new List<int>();
    for (int i = 0; i < results.length; i++) {
      listMovieId.add(results[i]['id']);
    }
    return listMovieId;
  }
}

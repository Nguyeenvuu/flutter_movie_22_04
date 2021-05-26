import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_app/models/api_cast_online.dart';
import 'package:movie_app/utils/url_base.dart';

class CastAndCrewRepository {
  var baseUrl = "http://api.themoviedb.org/3/";
  var key = api_key;

  Future<List<Cast>> getCastList(int movieId) async {
    final url =
        baseUrl + "movie/$movieId?api_key=$key&append_to_response=credits";
    print(url);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Cast> cast = CastAndCrew.fromJson(data).credits.cast;
      return cast;
    } else {
      throw Exception();
    }
  }
}

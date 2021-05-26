import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_app/utils/url_base.dart';

class UserApiClient {
  static Future<Map<String, dynamic>> Login(
      String userName, String password) async {
    http.Response response = await http.post(customerLoginUrl,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(
            <String, String>{'user_name': userName, 'password': password}));
    print(customerLoginUrl);
    try {
      Map<String, dynamic> resData = json.decode(response.body);
      print(resData);
      return resData;
    } catch (e) {
      print(e);
    }
  }
}

import 'package:http/http.dart' as http;
import 'package:movie_app/models/customer.dart';
import 'dart:convert';

import 'package:movie_app/utils/url_base.dart';

class UserRepositoryServer {
  //============================== Login User ========================================
  // ignore: missing_return
  Future<Map<String, dynamic>> login({String userName, String password}) async {
    http.Response response = await http.post(customerLoginUrl,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(
            <String, String>{'user_name': userName, 'password': password}));
    try {
      Map<String, dynamic> resData = json.decode(response.body);
      return resData;
    } catch (e) {
      print(e);
    }
  }

//======================================= Register User ================================
  Future<Map<String, dynamic>> register(
      {String userName,
      String password,
      String name,
      String email,
      String address,
      String birthday,
      String gender,
      String favorite}) async {
    http.Response response = await http.post(
      customerRegisterUrl,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, String>{
          'user_name': userName,
          'password': password,
          'name': name,
          'email': email,
          'adress': address,
          'birthday': birthday,
          'gender': gender,
          'favorite_genres': favorite
        },
      ),
    );

    Map<String, dynamic> resData = json.decode(response.body);
    return resData;
  }

  // Đăng ký user mới
  //   Map<String, dynamic> user1 = await UserRepository.register(
  //     userName: 'user_003',
  //     password: 'user_002',
  //     address: 'adasdas',
  //     birthday: '24-10-1998',
  //     email: "abc3@gmail.com",
  //     gender: "Female",
  //     name: "Nguyeen");
  // print('${user1.keys}: ${user1.values}');
  static Future<Map<String, dynamic>> registerStatic(
      {String userName,
      String password,
      String name,
      String email,
      String address,
      String birthday,
      String gender,
      String favorite}) async {
    http.Response response = await http.post(
      customerRegisterUrl,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, String>{
          'user_name': userName,
          'password': password,
          'name': name,
          'email': email,
          'adress': address,
          'birthday': birthday,
          'gender': gender,
          'favorite_genres': favorite
        },
      ),
    );

    Map<String, dynamic> resData = json.decode(response.body);
    return resData;
  }

//===============================================================
  static Future<String> getUSerById({int userId}) async {
    http.Response response = await http.post(customerDetailUrl,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, int>{'user_id': userId}));
    try {
      Map<String, dynamic> resData = json.decode(response.body);
      User user = User.fromJson(resData);
      return user.name;
    } catch (e) {
      print(e);
    }
  }

  @override
  String toString() {
    return "urlLogin: $customerLoginUrl, urlRegister: $customerLoginUrl";
  }
}

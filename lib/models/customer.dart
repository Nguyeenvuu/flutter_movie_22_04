import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class User extends Equatable {
  int userId;
  String userName;
  String name;
  String email;
  String adress;
  String birthday;
  String gender;

  User(
      {this.userId,
      this.userName,
      this.name,
      this.email,
      this.adress,
      this.birthday,
      this.gender});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userId: json['user_id'],
        userName: json['user_name'],
        name: json['name'],
        email: json['email'],
        adress: json['adress'],
        birthday: json['birthday'],
        gender: json['gender']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.adress;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
  }

  @override
  // TODO: implement props
  List<Object> get props => [userId, email];

  @override
  String toString() {
    // TODO: implement toString
    return "username: ${this.userName}, email: ${this.email}";
  }
}

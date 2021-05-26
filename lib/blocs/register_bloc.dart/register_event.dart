import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterEmailChanged extends RegisterEvent {
  final String email;

  RegisterEmailChanged({this.email});

  @override
  List<Object> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;

  RegisterPasswordChanged({this.password});

  @override
  List<Object> get props => [password];
}

class RegisterSubmitted extends RegisterEvent {
  final String email;
  final String password;
  final String userName;
  final String name;
  final String address;
  final String birthday;
  final String gender;
  final String favorite;

  RegisterSubmitted(
      {this.userName,
      this.password,
      this.email,
      this.name,
      this.address,
      this.birthday,
      this.gender,
      this.favorite});

  @override
  List<Object> get props => [email, password, userName];
}

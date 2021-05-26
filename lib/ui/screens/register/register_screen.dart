import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/register_bloc.dart/register_bloc.dart';
import 'package:movie_app/repositories/user_repository_server.dart';
import 'package:movie_app/ui/screens/register/register_form.dart';
import 'package:movie_app/utils/Sizes.dart';

class RegisterPage extends StatelessWidget {
  final UserRepositoryServer _userRepository;

  const RegisterPage({Key key, UserRepositoryServer userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSize.init(context);
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              RegisterBloc(userRepository: UserRepositoryServer()),
          child: Container(
            width: double.infinity,
            //tạo màu nền cho ứng dụng
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF2d3440),
              Color(0xFF2d3450),
              Color(0xFF2d3460)
            ])),
            //Dùng SingleChildScrollView cho ứng dụng có thể scroll được nếu kích thước màn hình nhỏ
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF2d3447),
                                blurRadius: 25,
                                offset: Offset(0, 10))
                          ]),
                      margin: const EdgeInsets.all(10),
                      child: RegisterForm(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

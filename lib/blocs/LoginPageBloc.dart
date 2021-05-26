import 'package:flutter/material.dart';
import 'package:movie_app/repositories/UserApiClient.dart';

import 'package:movie_app/models/User.dart';

class LoginPageBloc with ChangeNotifier {
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  User _user;

  User get user {
    return _user;
  }

  Future btnLoginPress(BuildContext context) async {
    Map<String, dynamic> res_data =
        await UserApiClient.Login(userController.text, passController.text);
    _user = User.fromJson(res_data);
    print(user.name);
    print(user.userId);
    if (res_data['Sign In Success']) {
//      Navigator.of(context).pop();
      if (res_data["user_id"] <= 270896) {
        Navigator.of(context).pushReplacementNamed(
          "/DrawerNavigation",
          arguments: _user,
        );
      } else {
        Navigator.of(context).pushReplacementNamed(
          "/DrawerNavigatorNewUser",
          arguments: _user,
        );
      }
    }
//    if (userController.text == _username && passController.text == _password){
//      Map<String,dynamic> res_data = {'success': true, 'user_id': 8, 'name': 'Tien Dat', 'email': 'tiendat@gmail.com', 'adress': 'Toulon, France', 'birthday': '1960-07-07', 'gender': 'male'};
//      Navigator.push(context, MaterialPageRoute(builder: (context) => DrawerNavigation(User.fromJson(res_data))));
//    }
    else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text("Login error!",
                    style: TextStyle(color: Colors.red, fontSize: 25)),
              ),
              content: Text("You entered the wrong username or password."),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "OK",
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
              elevation: 24.0,
            );
          });
    }
  }
}

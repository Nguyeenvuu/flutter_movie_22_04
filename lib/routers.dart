import 'package:flutter/material.dart';
import 'package:movie_app/repositories/user_repository_server.dart';
import 'package:movie_app/ui/drawer/drawer_navigator_new_user.dart';
import 'package:movie_app/ui/screens/LoginPage.dart';
import 'package:movie_app/ui/screens/TestScreen.dart';
import 'package:movie_app/ui/screens/homepage_new_user.dart';
import 'package:movie_app/ui/screens/register/register_screen.dart';
import 'package:movie_app/ui/welcome_page.dart';
import 'package:movie_app/ui/widgets/comment_widget.dart';
import 'package:movie_app/ui/widgets/video_play_widget.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    final UserRepositoryServer _userRepository = UserRepositoryServer();
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/Login':
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case '/Register':
        return MaterialPageRoute(
          builder: (_) => RegisterPage(
            userRepository: _userRepository,
          ),
        );
      case '/Test':
        return MaterialPageRoute(
            builder: (_) => TestWidget(
                  title: args,
                ));
      case '/DrawerNavigatorNewUser':
        return MaterialPageRoute(
            builder: (_) => DrawerNavigatorNewUser(user: args));
      case '/HomePageNewUser':
        return MaterialPageRoute(builder: (_) => HomePageNewUser(user: args));

      case '/videoTrailer':
        return MaterialPageRoute(
            builder: (_) => VideoScreen(
                  id: args,
                ));
      case '/CommentPage':
        return MaterialPageRoute(builder: (_) => CommentPage());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

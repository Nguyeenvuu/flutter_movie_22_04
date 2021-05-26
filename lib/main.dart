import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/routers.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generatorRoute,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:book_app/Presentation/Screens/home.dart';
import 'package:book_app/Presentation/Screens/login.dart';
import 'package:book_app/Presentation/Screens/splash.dart';
import 'package:flutter/material.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => Home());
      case 'splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case 'login':
        return MaterialPageRoute(builder: (_) => Login());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}

import 'package:flutter/material.dart';

import '../../view/Detail Screen.dart';
import '../../view/Homescreen.dart';
import '../../view/Login_View.dart';
import '../../view/SignUP.dart';
import '../../view/Splash_View_screen.dart';
import 'Routes_name.dart';

class Routes {
  static Route<dynamic>generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        {
          return MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen());
        }
      case RouteNames.login:
        {
          return MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen());
        }
      case RouteNames.SignUp:
        {
          return MaterialPageRoute(
              builder: (BuildContext context) => SignUPView());
        }
        case RouteNames.splash:
        {
          return MaterialPageRoute(
              builder: (BuildContext context) => SplashView());
        }
      case RouteNames.detailsscreen: {
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (BuildContext context) => MoviesDetails(
            title: arguments['title'],
            image: arguments['image'],
            releasedate: arguments['releasedate'],
            Genres: arguments['Genres'],
            Stoyline: arguments['Stoyline'],
          ),
        );
      }


      default:
        {
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
}

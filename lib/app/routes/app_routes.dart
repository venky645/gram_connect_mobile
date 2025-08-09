import 'package:flutter/material.dart';
import 'package:gram_connect/features/auth/presentation/auth/login_view.dart';
import 'package:gram_connect/features/home/presentation/home_view.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => LoginView());
      case home:
        return MaterialPageRoute(builder: (context) => HomeView());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('no routes found'))),
        );
    }
  }
}

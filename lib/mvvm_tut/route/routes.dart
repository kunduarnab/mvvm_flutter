import 'package:flutter/material.dart';
import 'package:mvvm/mvvm_tut/home_screen.dart';
import 'package:mvvm/mvvm_tut/login_screen.dart';
import 'package:mvvm/mvvm_tut/route/routes_name.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginView());
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                toolbarHeight: 0,
              ),
              body: const Center(
                child: Text("No routes found!"),
              ),
            );
          },
        );
    }
  }
}

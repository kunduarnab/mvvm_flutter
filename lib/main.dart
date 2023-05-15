import 'package:flutter/material.dart';
import 'package:mvvm/mvvm_tut/login_screen.dart';
import 'package:mvvm/mvvm_tut/route/routes.dart';
import 'package:mvvm/mvvm_tut/route/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MVVM',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LoginView(),
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}

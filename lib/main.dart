import 'package:flutter/material.dart';
import 'package:mvvm/api_tut/LoginScreen.dart';
import 'package:mvvm/api_tut/api_tut_page.dart';
import 'package:mvvm/api_tut/custom_model_api.dart';
import 'package:mvvm/api_tut/list_with_image.dart';
import 'package:mvvm/mvvm_tut/mvvm_tut_page.dart';

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
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            // builder: (context) => const ApiTutPage(),
                            // builder: (context) => const CustomModelApi(),
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text("API"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MvvmTutPage(),
                          ),
                        );
                      },
                      child: const Text("MVVM"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

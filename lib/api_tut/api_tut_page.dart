import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvvm/api_tut/model/post.dart';
import 'package:http/http.dart' as http;

class ApiTutPage extends StatefulWidget {
  const ApiTutPage({super.key});

  @override
  State<ApiTutPage> createState() => _ApiTutPageState();
}

class _ApiTutPageState extends State<ApiTutPage> {
  List<Post> itemList = [];

  Future<List<Post>> getPost() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      await Future.delayed(const Duration(seconds: 3));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (Map i in data) {
          itemList.add(Post.fromJson(i));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return itemList;
  }

  @override
  void initState() {
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api"),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: getPost(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // Show loading
            return const Center(child: CircularProgressIndicator());
          } else {
            // Show list
            return ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(itemList[index].title.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}

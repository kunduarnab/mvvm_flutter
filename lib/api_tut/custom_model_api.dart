import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomModelApi extends StatefulWidget {
  const CustomModelApi({Key? key}) : super(key: key);

  @override
  State<CustomModelApi> createState() => _CustomModelApiState();
}

class _CustomModelApiState extends State<CustomModelApi> {
  List<CustomPost> itemList = [];

  Future<List<CustomPost>> load() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var decodedResponse = jsonDecode(response.body.toString());
      for (Map i in decodedResponse){
        debugPrint("MAP - ${i['id'].toString()}");
        CustomPost customPost = CustomPost(
          id: i['id'].toString(),
          body: i['body'].toString(),
          title: i['title'].toString(),
          userId: i['userId'].toString()
        );
        itemList.add(customPost);
      }
      debugPrint("SIZE - ${itemList.length.toString()}");

    } catch (e) {
      debugPrint(e.toString());
    }
    return itemList;
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// Custom model class
class CustomPost {
  String? userId;
  String? id;
  String? title;
  String? body;

  CustomPost({this.userId, this.id, this.title, this.body});
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/album.dart';

class ListWithImage extends StatefulWidget {
  const ListWithImage({Key? key}) : super(key: key);

  @override
  State<ListWithImage> createState() => _ListWithImageState();
}

class _ListWithImageState extends State<ListWithImage> {
  List<Album> itemList = [];

  Future<List<Album>> load() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if (response.statusCode == 200) {
        itemList.clear();
        var data = jsonDecode(response.body.toString());
        for (Map i in data) {
          itemList.add(Album.fromJson(i));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return itemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List with image"),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: load(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Show list
            return ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                var x = itemList[index];
                return ListTile(
                  title: Text(x.title.toString()),
                  subtitle: Text(x.thumbnailUrl.toString()),
                  leading: Image.network(x.thumbnailUrl.toString()),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpDemo"),
      ),
      body: HttpDemoHemo(),
    );
  }
}

class HttpDemoHemo extends StatefulWidget {
  @override
  _HttpDemoHemoState createState() => _HttpDemoHemoState();
}

class _HttpDemoHemoState extends State<HttpDemoHemo> {
  @override
  void initState() {
    super.initState();
    fetchPost().then((value) => print(value));
  }

  Future<List<Post>> fetchPost() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    print('statusCode: ${response.statusCode}');

    if (response.statusCode == 200) {
      final respostBody = json.decode(response.body);
      List<Post> posts = respostBody['posts']
          .map<Post>((item) => Post.fromJson(item))
          .toList();
      return posts;
    }
    // final post = {"title": "Darren", "description": "nice to meet you "};
    // final postJson = json.encode(post);

    // print(postJson);

    // final postJsonMap = json.decode(postJson);
    // final postModel = Post.fromJson(postJsonMap);
    // print("title:${postModel.title},des:${postModel.description}");
    // print(postModel.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPost(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('${snapshot.data}');
        print('${snapshot.connectionState}');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        }
        return ListView(
          children: snapshot.data.map<Widget>((item) {
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post({
    this.id,
    this.title,
    this.description,
    this.author,
    this.imageUrl,
  });

  Post.fromJson(Map json)
      : id = json["id"],
        title = json["title"],
        description = json["description"],
        author = json['author'],
        imageUrl = json['imageUrl'];

  Map toJson() => {
        "id": id,
        "title": title,
        "dis": description,
        'author': author,
        'imageUrl': imageUrl
      };
}

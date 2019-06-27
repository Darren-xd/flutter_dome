import 'package:flutter/material.dart';
import 'package:flutter_dome/data_source/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Demo"),
      ),
      body: Container(
        margin: EdgeInsets.all(0.0),
        child: ListView(
          children: posts.map((post) {
            return Card(
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0)),
                      child: Image.network(
                        post.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(post.title),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(post.imageUrl),
                    ),
                    subtitle: Text(post.author),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      post.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Text("Like"),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text("Like"),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text("Like"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

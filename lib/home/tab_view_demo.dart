import 'package:flutter/material.dart';

class TabViewDemo extends StatefulWidget {
  @override
  _TabViewDemoState createState() => _TabViewDemoState();
}

class _TabViewDemoState extends State<TabViewDemo> {
  String url =
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561205299484&di=28793bf2f1bb2bc50248d2b8efc6e1e9&imgtype=0&src=http%3A%2F%2Fs1.sinaimg.cn%2Fmw690%2F006fmRRJzy745Jb6KxG00%26690';
  Widget _pageImageItem() {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.green,
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 30,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "Darren",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("--作者"),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(
      scrollDirection: Axis.vertical,
      controller: PageController(initialPage: 0, viewportFraction: 1.0),
      children: <Widget>[
        _pageImageItem(),
        _pageImageItem(),
      ],
    ));
  }
}

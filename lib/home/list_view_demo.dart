import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  String url =
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561205299484&di=28793bf2f1bb2bc50248d2b8efc6e1e9&imgtype=0&src=http%3A%2F%2Fs1.sinaimg.cn%2Fmw690%2F006fmRRJzy745Jb6KxG00%26690';
  Widget _listViewItem(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Darren",
                  style: TextStyle(fontSize: 30),
                ),
                Text("--作者"),
                SizedBox(height: 10),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(.3),
                highlightColor: Colors.white.withOpacity(.1),
                onTap: () {
                  debugPrint("TAP");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: _listViewItem,
    );
  }
}

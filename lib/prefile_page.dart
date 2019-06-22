import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:markdown/markdown.dart';

class PrefilePage extends StatefulWidget {
  @override
  _PrefilePageState createState() => _PrefilePageState();
}

class _PrefilePageState extends State<PrefilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prefile Page',
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.all(40),
            icon: Icon(Icons.arrow_back),
            // onPressed: () => Navigator.pop(context),
          ),
          Container(
              color: Colors.black26,
              // height: 100,
              // margin: const EdgeInsets.all(10),
              // padding: const EdgeInsets.all(10),
              // child: getColumnView(),
              // child: getRowView(),
              child: Row(
                children: <Widget>[
                  _getButtonItem(Icons.star, '1100'),
                ],
              ))
        ],
      ),
    );
  }
}

getRowView() {
  return Row(
    // mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        '我是Darren',
        style: TextStyle(backgroundColor: Colors.green),
      ),
      Text(
        '我是Darren',
        style: TextStyle(backgroundColor: Colors.green, fontSize: 30),
      ),
      Text(
        '我是Darren',
        style: TextStyle(backgroundColor: Colors.green),
      ),
      Center(
        child: Text('你好啊'),
      )
    ],
  );
}

getColumnView() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        'data',
        style: TextStyle(backgroundColor: Colors.green),
      ),
      Text(
        'datqweqwea',
        style: TextStyle(backgroundColor: Colors.green),
      ),
      Text(
        'datqweqweqweqweqwea',
        style: TextStyle(backgroundColor: Colors.green),
      ),
    ],
  );
}

_getButtonItem(IconData icon, String text) {
  return new Expanded(
    child: new Center(
      child: new Row(
        children: <Widget>[
          new Icon(
            icon,
            size: 14.0,
          ),
          new Padding(padding: new EdgeInsets.all(0.0)),
          new Text(
            text,
            style: TextStyle(color: Colors.red, fontSize: 14.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Card(
            child: Text('123'),
          )
        ],
      ),
    ),
  );
}

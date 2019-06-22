import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeBodyCell extends StatefulWidget {
  @override
  _HomeBodyCellState createState() => _HomeBodyCellState();
}

class _HomeBodyCellState extends State<HomeBodyCell> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        // color: Colors.green,
        margin: const EdgeInsets.only(top: 5, left: 5),
        child: getHeadView(),
      ),
      getBodyView(),
      getBottomView(),
    ]);
  }
}

getBodyView() {
  return Container(
    // color: Colors.black26,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            "这里有个官方的解释图，比较形象的说明了AppBar的结构",
            style: TextStyle(fontSize: 16),
          ),
        ),
        Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560337850407&di=6aec88550efa99631085263dd4767784&imgtype=0&src=http%3A%2F%2Fimg.sccnn.com%2Fbimg%2F337%2F31452.jpg'),
      ],
    ),
  );
}

getBottomView() {
  return Container(
    // color: Colors.red,
    height: 35,
    margin: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            child: Text(
              '查看',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
            ),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: FlatButton(
            child: Text(
              '点赞',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
            ),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: FlatButton(
            child: Text(
              '更多',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
            ),
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}

getHeadView() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: new Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560337850407&di=6aec88550efa99631085263dd4767784&imgtype=0&src=http%3A%2F%2Fimg.sccnn.com%2Fbimg%2F337%2F31452.jpg",
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                "Darren",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5.0, top: 5),
              child: Text(
                '三分钟前',
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

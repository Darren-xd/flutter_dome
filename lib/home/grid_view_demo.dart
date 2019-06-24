import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  List<Widget> _itemList = new List();
  String url =
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561217188464&di=c7f21fa7ddd5d3e84fd02a10ec6a782b&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201512%2F12%2F20151212193107_ujGZV.jpeg';
  void initData() {
    _itemList = List.generate(10, (index) {
      return new Container(
        color: Colors.grey[300],
        child: Stack(
          children: <Widget>[
            Image.network(url),
            Positioned(
              left: 10,
              bottom: 10,
              child: Column(
                children: <Widget>[
                  Text(
                    "Darren",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _gridViewItemView(context, index) {
    return Container(
      color: Colors.green[200],
      child: Center(
        child: Text("Items"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    initData();

    // return GridView.count(
    //   crossAxisSpacing: 1,
    //   mainAxisSpacing: 1,
    //   crossAxisCount: 3,
    //   children: _itemList,
    //   padding: EdgeInsets.all(1),
    // );

    // return GridView.extent(
    //   maxCrossAxisExtent: 200,
    //   crossAxisSpacing: 10,
    //   mainAxisSpacing: 10,
    //   scrollDirection: Axis.vertical,
    //   children: _itemList,
    // );

    return GridView.builder(
      itemCount: _itemList.length,
      itemBuilder: _gridViewItemView,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );
  }
}

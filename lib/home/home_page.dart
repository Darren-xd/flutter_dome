import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _tabList;
  List<Widget> _controllerList;

  void initData() {
    _tabList = [
      Tab(
        // icon: Icon(Icons.pages),
        child: Text(
          "Darren",
          style: TextStyle(fontSize: 30),
        ),
      ),
      Tab(
        icon: Icon(Icons.grid_on),
      ),
      Tab(
        icon: Icon(Icons.face),
      ),
      Tab(
        icon: Icon(Icons.face),
      ),
      Tab(
        icon: Icon(Icons.face),
      ),
      Tab(
        icon: Icon(Icons.face),
      ),
    ];
    _controllerList = [
      ViewDemo(),
      GridViewDemo(),
      TabViewDemo("TAB2"),
      TabViewDemo("TAB2"),
      TabViewDemo("TAB2"),
      TabViewDemo("TAB2"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return DefaultTabController(
      length: _tabList.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Home"),
            bottom: TabBar(
              tabs: _tabList,
              isScrollable: true,
              indicatorWeight: .5,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.only(bottom: 10.0),
            ),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ),
          body: TabBarView(
            children: _controllerList,
          )),
    );
  }
}

class ViewDemo extends StatelessWidget {
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
      controller: PageController(initialPage: 0, viewportFraction: 1.0),
      children: <Widget>[
        _pageImageItem(),
        _pageImageItem(),
      ],
    ));
  }
}

class TabViewDemo extends StatelessWidget {
  const TabViewDemo(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class GridViewDemo extends StatelessWidget {
  List<Widget> _itemList = new List();
  void initData() {
    for (int index = 0; index < 200; index++) {
      Widget e = new Container(
        color: Colors.grey[300],
        child: Center(
          child: Text(
            "Item",
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      );
      _itemList.add(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return GridView.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children: _itemList,
    );
  }
}

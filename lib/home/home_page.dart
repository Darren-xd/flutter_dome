import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dome/home/grid_view_demo.dart';
import 'package:flutter_dome/home/list_view_demo.dart';
import 'package:flutter_dome/home/tab_view_demo.dart';
import 'package:flutter_dome/prefile/prefile_page.dart';
import 'package:flutter_dome/prefile/slivers_grid_demo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _tabList;
  List<Widget> _controllerList;

  Tab getItemTab(title) {
    return Tab(child: Text(title, style: TextStyle(fontSize: 20)));
  }

  Container getContextItem(title) {
    return Container(child: Center(child: Text(title)));
  }

  void initData() {
    _tabList = [
      getItemTab('ListView'),
      getItemTab('PageView'),
      getItemTab('GridView'),
      getItemTab('Tab'),
    ];
    _controllerList = [
      ListViewDemo(),
      TabViewDemo(),
      GridViewDemo(),
      getContextItem("TAB2"),
      // SliversGridDemo(),
      // new PrefilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return DefaultTabController(
      length: _tabList.length,
      child: Scaffold(
        appBar: AppBar(
          // title: Text("Home"),
          title: TabBar(
            tabs: _tabList,
            isScrollable: true,
            indicatorWeight: .5,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.only(bottom: 10.0),
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[800],
          ),
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {},
          // ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.input),
              onPressed: () {
                Navigator.of(context).pushNamed("/button");
              },
            )
          ],
        ),
        body: TabBarView(
          children: _controllerList,
        ),
        drawer: Drawer(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 60,
                width: 200,
                child: Text("Item$index"),
              );
            },
          ),
        ),
      ),
    );
  }
}

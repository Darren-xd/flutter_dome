import 'package:flutter/material.dart';
import 'package:flutter_dome/home/home_page.dart';
import 'package:flutter_dome/prefile_page.dart';
import 'package:flutter_dome/settings/setting_page.dart';

class AppBarView extends StatefulWidget {
  @override
  _AppBarViewState createState() => _AppBarViewState();
}

class _AppBarViewState extends State<AppBarView> {
  int _selectIndex = 0;
  List pages = new List();

  _bottomChangleIndex(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pages.add(HomePage());
    pages.add(PrefilePage());
    pages.add(SettingPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectIndex],
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Darren"),
            )
          ],
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
          currentIndex: _selectIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.people), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), title: Text('Settings')),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), title: Text('Settings'))
          ],
          onTap: (index) {
            _bottomChangleIndex(index);
          }),
    );
  }
}

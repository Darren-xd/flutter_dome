import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dome/demo/navigator_demo.dart';
import 'package:flutter_dome/home/home_page.dart';
import 'package:flutter_dome/prefile/prefile_page.dart';
import 'package:flutter_dome/settings/settings_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // home: RootView(),
      // home: NavigatorDemo(),

      initialRoute: '/',
      routes: {
        '/': (context) => RootView(),
        '/about': (context) => Page(
              title: "ABOUT",
            ),
      },
    );

    // return CupertinoApp(
    //   title: 'IOS',
    //   theme: CupertinoThemeData(primaryColor: Colors.pink),
    //   home: CupertinoTabScaffold(
    //     tabBar: CupertinoTabBar(
    //       items: [
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.home), title: Text("Home")),
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.settings), title: Text("Settings")),
    //       ],
    //     ),
    //     tabBuilder: (context, index) {
    //       return Center(
    //           child: Row(
    //         children: <Widget>[
    //           Text("Index $index"),
    //           CupertinoButton(
    //             child: Text("Button"),
    //             onPressed: () {},
    //           )
    //         ],
    //       ));
    //     },
    //   ),
    // );
  }
}

class RootView extends StatefulWidget {
  @override
  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _currentIndex = 0;
  List _bodyList = new List();

  onCurrentChangle(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void initData() {
    _bodyList = [
      HomePage(),
      PrefilePage(),
      SettingsPage(),
    ];
  }

  List<BottomNavigationBarItem> buttonList() {
    return [
      BottomNavigationBarItem(title: Text("Home"), icon: Icon(Icons.home)),
      BottomNavigationBarItem(
          title: Text("Prefile"), icon: Icon(Icons.account_circle)),
      BottomNavigationBarItem(
          title: Text("Settings"), icon: Icon(Icons.settings)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: _bodyList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: buttonList(),
          onTap: onCurrentChangle,
        ),
      ),
    );
  }
}

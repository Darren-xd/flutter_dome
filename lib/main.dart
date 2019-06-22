import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: RootView(),
    );
  }
}

class RootView extends StatefulWidget {
  @override
  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            print("Icon click");
          },
        ),
      ),
      body: HomePage(),
      drawer: Drawer(
        child: Text("Drawer"),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageViewDemo();
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      controller: PageController(
        initialPage: 0,
        // keepPage: false,
        // viewportFraction: 0.8,
      ),
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          color: Colors.green,
          child: Text(
            "ONE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.grey[900],
          child: Text(
            "Tow",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.red[200],
          child: Text(
            "三",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
            ),
          ),
        ),
      ],
    );
    ;
  }
}

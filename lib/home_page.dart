import 'package:flutter/material.dart';
import 'package:flutter_dome/home/home_body.dart';
import 'package:flutter_dome/prefile_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  int _selectIndex = 0;

  _bottomChangleIndex(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
        leading: IconButton(
          icon: Icon(
            Icons.camera,
          ),
          onPressed: () => {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new PrefilePage(),
                ),
              );
            },
          )
        ],
      ),
      body: new HomeDody(),
      // bottomNavigationBar: new BottomNavigationBar(
      //     currentIndex: _selectIndex,
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.people), title: Text('Home')),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.people), title: Text('Home'))
      //     ],
      //     onTap: (index) {
      //       _bottomChangleIndex(index);
      //     }),
      drawer: Drawer(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Text("Hello$index"),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.face),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ))),
    );
  }
}

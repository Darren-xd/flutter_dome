import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dome/home/cell/home_body_cell.dart';

class HomeDody extends StatefulWidget {
  @override
  _HomeDodyState createState() => _HomeDodyState();
}

class _HomeDodyState extends State<HomeDody> {
  List list = new List();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await Future.delayed(Duration(seconds: 20), () {
      setState(() {
        list = List.generate(15, (i) => '哈喽');
      });
    });
  }

  Future<Null> _onRefresh() async {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      child: Container(
        child: ListView.builder(
          // padding: new EdgeInsets.all(5.0),
          itemCount: list.length,
          // itemExtent: 50,
          itemBuilder: (BuildContext context, int index) {
            return HomeBodyCell();
          },
        ),
      ),
      onRefresh: _onRefresh,
    );
  }
}

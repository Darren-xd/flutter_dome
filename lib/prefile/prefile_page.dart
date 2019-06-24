import 'package:flutter/material.dart';
import 'package:flutter_dome/prefile/slivers_grid_demo.dart';
import 'package:flutter_dome/prefile/slivers_list_demo.dart';

class PrefilePage extends StatefulWidget {
  @override
  _PrefilePageState createState() => _PrefilePageState();
}

class _PrefilePageState extends State<PrefilePage> {
  String url =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561365839380&di=f81bf02990929e5564fc1a33dd26ed54&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fa1f75abec65eaf98f13096354a4c7238cd8df04e4181f-TITew2_fw658";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // title: Text("TEXT"),
            floating: true,
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Darren xu".toUpperCase()),
              background: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliversListDemo(),
            ),
          ),
        ],
      ),
    );
  }
}

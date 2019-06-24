import 'package:flutter/material.dart';

class SliversGridDemo extends StatefulWidget {
  @override
  _SliversGridDemoState createState() => _SliversGridDemoState();
}

class _SliversGridDemoState extends State<SliversGridDemo> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              "Items$index",
              style: TextStyle(fontSize: 30),
            ),
            color: Colors.grey[500],
          );
        },
        childCount: 100,
      ),
    );
  }
}

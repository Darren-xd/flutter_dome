import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PrefilePage extends StatefulWidget {
  @override
  _PrefilePageState createState() => _PrefilePageState();
}

class _PrefilePageState extends State<PrefilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prefile Page',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple,
      ),
      body: Text('Prefile Page'),
    );
  }
}

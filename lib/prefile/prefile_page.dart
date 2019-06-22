import 'package:flutter/material.dart';

class PrefilePage extends StatefulWidget {
  @override
  _PrefilePageState createState() => _PrefilePageState();
}

class _PrefilePageState extends State<PrefilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prefile Page"),
      ),
      body: Text("Prefile"),
    );
  }
}

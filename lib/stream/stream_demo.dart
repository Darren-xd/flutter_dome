import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamDemo;
  StreamSink _streamSink;

  String msg = "";

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamDemo = StreamController<String>();
    _streamDemo = StreamController.broadcast();
    _streamSink = _streamDemo.sink;
    _streamSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);

    _streamSubscription =
        _streamDemo.stream.listen(onTowData, onError: onError, onDone: onDone);
  }

  void onData(String data) {
    print('11111 $data');
    setState(() {
      msg = data;
    });
  }

  void onTowData(String data) {
    print("tow $data");
  }

  void onError(error) {
    print('Error:$error');
  }

  void onDone() {
    print("Done");
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw "holo";
    return "hello ~";
  }

  void _pauseStream() {
    print("pause");
    _streamSubscription.pause();
  }

  void _resumeStream() {
    print("resume");
    _streamSubscription.resume();
  }

  void _cancelStream() {
    print("cancel");
    _streamSubscription.cancel();
  }

  void _addDataToStream() async {
    print("Add data to stream");
    String data = await fetchData();
    // _streamDemo.add(data);

    _streamSink.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Demo"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              initialData: "...",
              stream: _streamDemo.stream,
              builder: (context, snapshot) {
                return Text("${snapshot.data}");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("Add"),
                  onPressed: _addDataToStream,
                ),
                FlatButton(
                  child: Text("Pause"),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text("Resume"),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text("Cancel"),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

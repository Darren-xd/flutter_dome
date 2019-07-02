import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatefulWidget {
  @override
  _RxDartDemoState createState() => _RxDartDemoState();
}

class _RxDartDemoState extends State<RxDartDemo> {
  @override
  void initState() {
    super.initState();
    // Observable<String> _observable =
    // Observable(Stream.fromIterable(['hello', '你好']));
    // Observable.fromFuture(Future.value('helo'));
    // Observable.fromIterable(['data', 'dee']);
    // Observable.periodic(Duration(seconds: 3), (x) => x.toString());
    // _observable.listen(print);

    PublishSubject<String> _subject = PublishSubject<String>();
    _subject.listen((data) => print("listen 1:$data"));
    _subject.add("hello");
    _subject.listen((data) => print("listen 1:${data.toUpperCase()}"));
    _subject.add("3333");
    _subject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RxDart Demo"),
      ),
    );
  }
}

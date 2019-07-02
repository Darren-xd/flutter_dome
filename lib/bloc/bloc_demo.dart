import 'dart:async';

import 'package:flutter/material.dart';

class BlocDemo extends StatefulWidget {
  @override
  _BlocDemoState createState() => _BlocDemoState();
}

class _BlocDemoState extends State<BlocDemo> {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("BlocDemo"),
          elevation: 0.0,
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _conterBloc = CounterProvider.of(context).bloc;
    return Center(
        child: StreamBuilder(
      initialData: 0,
      stream: _conterBloc.count,
      builder: (context, snapshot) {
        return ActionChip(
          label: Text('${snapshot.data}'),
          onPressed: () {
            _conterBloc.counter.add(1);
          },
        );
      },
    ));
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _conterBloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        // _conterBloc.log();
        _conterBloc.counter.add(1);
      },
    );
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  CounterProvider({this.child, this.bloc}) : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;
  final _conterActionController = StreamController<int>();
  StreamSink<int> get counter => _conterActionController.sink;
  final _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream;
  CounterBloc() {
    _conterActionController.stream.listen(onData);
  }

  void onData(int data) {
    print("$data");
    _count = data + _count;
    _counterController.add(_count);
  }

  void disponse() {
    _conterActionController.close();
  }

  void log() {
    print("Bloc");
  }
}

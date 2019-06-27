import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Demo"),
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CounterWrapper(),
                    Text(""),
                  ],
                )
              ],
            ),
          ),
          floatingActionButton: ScopedModelDescendant<CounterModel>(
            rebuildOnChange: false,
            builder: (context, _, model) => FloatingActionButton(
                  child: Icon(Icons.send),
                  onPressed: model.increaseCount,
                ),
          )),
    );
  }
}

// class StateManagerDemo extends StatefulWidget {
//   @override
//   _StateManagerDemoState createState() => _StateManagerDemoState();
// }

// class _StateManagerDemoState extends State<StateManagerDemo> {
//   int count = 0;

//   _increaseCount() {
//     setState(() {
//       count += 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CounterProvider(
//       count: count,
//       increaseCount: _increaseCount,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("State Manager"),
//         ),
//         body: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   CounterWrapper(),
//                   StatuRow(),
//                 ],
//               ),
//               StatuRow(),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           elevation: 0.0,
//           child: Icon(Icons.send),
//           onPressed: _increaseCount,
//         ),
//       ),
//     );
//   }
// }

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Counter();
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final int count = CounterProvider.of(context).count;
    // final VoidCallback increaseCount =
    //     CounterProvider.of(context).increaseCount;
    // return ActionChip(
    //   label: Text("$count"),
    //   onPressed: increaseCount,
    // );

    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
            label: Text("${model._count}"),
            onPressed: model.increaseCount,
          ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;
  CounterProvider({this.count, this.increaseCount, this.child})
      : super(child: child);
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class StatuRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    return Container(
      child: Text("$count"),
    );
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}

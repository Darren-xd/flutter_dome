import 'package:flutter/material.dart';

class AnimactionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimactionDemo"),
      ),
      body: AnimactionDemoHome(),
    );
  }
}

class AnimactionDemoHome extends StatefulWidget {
  @override
  _AnimactionDemoHomeState createState() => _AnimactionDemoHomeState();
}

class _AnimactionDemoHomeState extends State<AnimactionDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      // value: 40.0,
      // lowerBound: 40.0,
      // upperBound: 100.0,
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    curve =
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut);

    animation = Tween(begin: 32.0, end: 100.0).animate(curve);

    animationColor =
        ColorTween(begin: Colors.red, end: Colors.black).animate(curve);

    // animationController.addListener(() {
    //   // print("${animationController.value}");
    //   setState(() {});
    // });
    animationController.addStatusListener((AnimationStatus animationStatus) {
      print('${animationStatus}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedHeart(
        animations: [animation, animationColor],
        controller: animationController,
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({this.animations, this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      // iconSize: animationController.value,
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        // animationController.forward();
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
            controller.forward();
        }
      },
    );
  }
}

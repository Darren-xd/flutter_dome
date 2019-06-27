import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StepperDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                  // primaryColor: Colors.black,
                  ),
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: (int value) {
                  setState(() {
                    _currentStep = value;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                  });
                },
                steps: [
                  Step(
                    title: Text("Step 1"),
                    subtitle: Text("Step 1"),
                    content: Text(
                        "Flutter拥有丰富的工具和库，可以帮助您轻松地同时在iOS和Android系统中实现您的想法和创意。 如果您没有任何移动端开发体验，Flutter是一种轻松快捷的方式来构建漂亮的移动应用程序。 如果您是一位经验丰富的iOS或Android开发人员，则可以使用Flutter作为视图(View)层， 并可以使用已经用Java / ObjC / Swift完成的部分（Flutter支持混合开发）"),
                    isActive: _currentStep == 0,
                  ),
                  Step(
                    title: Text("Step 2"),
                    subtitle: Text("Step 2"),
                    content: Text(
                        "Flutter拥有丰富的工具和库，可以帮助您轻松地同时在iOS和Android系统中实现您的想法和创意。 如果您没有任何移动端开发体验，Flutter是一种轻松快捷的方式来构建漂亮的移动应用程序。 如果您是一位经验丰富的iOS或Android开发人员，则可以使用Flutter作为视图(View)层， 并可以使用已经用Java / ObjC / Swift完成的部分（Flutter支持混合开发）"),
                    isActive: _currentStep == 1,
                  ),
                  Step(
                    title: Text("Step 3"),
                    subtitle: Text("Login first"),
                    content: Text(
                        "Flutter拥有丰富的工具和库，可以帮助您轻松地同时在iOS和Android系统中实现您的想法和创意。 如果您没有任何移动端开发体验，Flutter是一种轻松快捷的方式来构建漂亮的移动应用程序。 如果您是一位经验丰富的iOS或Android开发人员，则可以使用Flutter作为视图(View)层， 并可以使用已经用Java / ObjC / Swift完成的部分（Flutter支持混合开发）"),
                    isActive: _currentStep == 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

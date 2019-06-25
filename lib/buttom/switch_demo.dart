import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchItemA = false;
  double _sliderItemA = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SwtichDemo"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              title: Text("Switch Title"),
              subtitle: Text("Switch subtitle"),
              secondary:
                  Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
              selected: _switchItemA,
              value: _switchItemA,
              onChanged: (value) {
                setState(() {
                  _switchItemA = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _switchItemA ? "😁" : "😿",
                  style: TextStyle(fontSize: 40),
                ),
                Switch(
                  value: _switchItemA,
                  onChanged: (value) {
                    setState(() {
                      _switchItemA = value;
                    });
                  },
                ),
              ],
            ),
            Slider(
              max: 100,
              min: 0,
              divisions: 10,
              label: "$_sliderItemA",
              inactiveColor: Theme.of(context).accentColor.withOpacity(.3),
              value: _sliderItemA,
              onChanged: (value) {
                setState(() {
                  _sliderItemA = value;
                });
              },
            ),
            Text("Slider value :$_sliderItemA"),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _checkboxItemA = false;
  int _radioGroupA = 0;
  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget checkboxListDemo = CheckboxListTile(
      value: _checkboxItemA,
      onChanged: (value) {
        setState(() {
          _checkboxItemA = value;
        });
      },
      title: Text("Darren"),
      subtitle: Text("Desc"),
      secondary: Icon(Icons.add),
      selected: _checkboxItemA,
    );

    Widget checkboxDemo = Checkbox(
      value: _checkboxItemA,
      onChanged: (value) {
        setState(() {
          _checkboxItemA = value;
        });
      },
    );

// Widget radioDemo =

    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox"),
        elevation: 0.0,
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          checkboxDemo,
          checkboxListDemo,
          RadioListTile(
            value: 0,
            groupValue: _radioGroupA,
            onChanged: _handleRadioValueChanged,
            title: Text("Darren"),
            subtitle: Text("subtitle"),
            secondary: Icon(Icons.add),
            selected: _radioGroupA == 0,
          ),
          RadioListTile(
            value: 1,
            groupValue: _radioGroupA,
            onChanged: _handleRadioValueChanged,
            title: Text("DarrenA"),
            subtitle: Text("subtitleA"),
            secondary: Icon(Icons.add),
            selected: _radioGroupA == 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: _radioGroupA,
                onChanged: _handleRadioValueChanged,
              ),
              Radio(
                value: 1,
                groupValue: _radioGroupA,
                onChanged: _handleRadioValueChanged,
              ),
            ],
          )
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';

enum Option {
  A,
  B,
}

enum Action {
  OK,
  Cancel,
}

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice = '';
  final _bottomSheetScafffoldKey = GlobalKey<ScaffoldState>();

  _openSimpleDialog() async {
    final Option option = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("Title"),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("OptionA"),
              onPressed: () {
                Navigator.pop(context, Option.A);
              },
            ),
            SimpleDialogOption(
              child: Text("OptionB"),
              onPressed: () {
                Navigator.pop(context, Option.B);
              },
            ),
          ],
        );
      },
    );
    switch (option) {
      case Option.A:
        setState(() {
          _choice = "A";
        });

        break;
      case Option.B:
        setState(() {
          _choice = "B";
        });
        break;
      default:
    }
  }

  _openAlertDialog() async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Alert"),
            content: Text("Are you sure about this ?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context, Action.Cancel);
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context, Action.OK);
                },
              ),
            ],
          );
        });
    switch (action) {
      case Action.OK:
        setState(() {
          _choice = "OK";
        });
        break;
      case Action.Cancel:
        setState(() {
          _choice = "Cancel";
        });
        break;
      default:
    }
  }

  _openSheetDialog() {
    _bottomSheetScafffoldKey.currentState
        .showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          width: double.infinity,
          height: 90.0,
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(width: 20),
              Text("01:30/03:30"),
              Expanded(
                child: Text(
                  "Fix you - Coldplay",
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  _openModelSheetDialog() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("Option A"),
                  onTap: () {
                    Navigator.pop(context, "A");
                  },
                ),
                ListTile(
                  title: Text("Option B"),
                  onTap: () {
                    Navigator.pop(context, "B");
                  },
                ),
                ListTile(
                  title: Text("Option C"),
                  onTap: () {
                    Navigator.pop(context, "C");
                  },
                ),
              ],
            ),
          );
        });
    print(option);
  }

  _openSncakBarDialog() {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Processing..."),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScafffoldKey,
      appBar: AppBar(
        title: Text("SimpleDialog"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$_choice",
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
            SizedBox(height: 20),
            OutlineButton.icon(
              icon: Icon(Icons.ac_unit),
              label: Text("Alert"),
              onPressed: _openAlertDialog,
            ),
            SizedBox(height: 20),
            OutlineButton.icon(
              icon: Icon(Icons.ac_unit),
              label: Text("Sheet"),
              onPressed: _openSheetDialog,
            ),
            SizedBox(height: 20),
            OutlineButton.icon(
              icon: Icon(Icons.ac_unit),
              label: Text("Model Bottom Sheet"),
              onPressed: _openModelSheetDialog,
            ),
            SnackBarButton(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.menu),
        elevation: 0.0,
        onPressed: _openSimpleDialog,
      ),
    );
  }
}

class SnackBarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text("Open SnackBar"),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Processing..."),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {},
          ),
        ));
      },
    );
  }
}

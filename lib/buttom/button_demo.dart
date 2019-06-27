import 'package:flutter/material.dart';
import 'package:flutter_dome/buttom/checkbox_demo.dart';
import 'package:flutter_dome/buttom/date_time_demo.dart';
import 'package:flutter_dome/buttom/popup_menu_button_demo.dart';
import 'package:flutter_dome/buttom/switch_demo.dart';
import 'package:flutter_dome/card/card_demo.dart';
import 'package:flutter_dome/card/stepper_demo.dart';
import 'package:flutter_dome/chip/chip_demo.dart';
import 'package:flutter_dome/datatable/datatable_demo.dart';
import 'package:flutter_dome/dialog/expansion_panel_demo.dart';
import 'package:flutter_dome/dialog/simple_dialog_demo.dart';
import 'package:flutter_dome/stream/stream_demo.dart';

class ButtonDemo extends StatefulWidget {
  @override
  _ButtonDemoState createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonDemo"),
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: "ButtonDemo",
            page: ButtonOneDemo(),
          ),
          ListItem(
            title: "FloactingActionButton",
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: "PopupMenuButton",
            page: PopupMenuButtonDemo(),
          ),
          ListItem(
            title: "CheckboxDemo",
            page: CheckboxDemo(),
          ),
          ListItem(
            title: "SwitchDemo",
            page: SwitchDemo(),
          ),
          ListItem(
            title: "DateTimeDemo",
            page: DateTimeDemo(),
          ),
          ListItem(
            title: "SimpleDialogDemo",
            page: SimpleDialogDemo(),
          ),
          ListItem(
            title: "ExpansionPanelDemo",
            page: ExpansionPanelDemo(),
          ),
          ListItem(
            title: "ChipDemo",
            page: ChipDemo(),
          ),
          ListItem(
            title: "DataTableDemo",
            page: DataTableDemo(),
          ),
          ListItem(
            title: "CardDemo",
            page: CardDemo(),
          ),
          ListItem(
            title: "StepperDemo",
            page: StepperDemo(),
          ),
          ListItem(
            title: "StreamDemo",
            page: StreamDemo(),
          ),
        ],
      ),
    );
  }
}

class ButtonOneDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget FlatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text("Button"),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text("Button"),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );

    final Widget RaisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Colors.green,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0),
              // ),
              shape: StadiumBorder(),
            ),
          ),
          child: RaisedButton(
            child: Text("Button"),
            onPressed: () {},
            splashColor: Colors.grey,
            elevation: 0.0,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        RaisedButton(
          child: Text("Button"),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
          elevation: 0.0,
          color: Theme.of(context).accentColor,
        ),
        SizedBox(
          width: 16.0,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text("Button"),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
          elevation: 10.0,
        ),
      ],
    );

    final Widget OutlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          child: Text("Button"),
          onPressed: () {},
          splashColor: Colors.grey[100],
          borderSide: BorderSide(color: Colors.black),
          textColor: Colors.red,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text("BUTTON"),
          onPressed: () {},
          highlightColor: Colors.pink,
        )
      ],
    );

    final Widget FixedWidthButton = Row(
      children: <Widget>[
        Container(
          width: 170,
          child: OutlineButton(child: Text("BUTTON")),
        )
      ],
    );

    final Widget ExpandButtonDemo = Row(
      children: <Widget>[
        Expanded(
          child: OutlineButton(child: Text("BUTTON")),
          flex: 1,
        ),
        SizedBox(width: 10),
        Expanded(
          child: OutlineButton(child: Text("BUTTON")),
          flex: 2,
        ),
      ],
    );

    final Widget ButtonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                  padding: EdgeInsets.symmetric(horizontal: 12))),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(child: Text("BUTTON1")),
              OutlineButton(child: Text("BUTTON")),
              // OutlineButton(child: Text("BUTTON")),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonOneDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButtonDemo,
            RaisedButtonDemo,
            OutlineButtonDemo,
            FixedWidthButton,
            ExpandButtonDemo,
            ButtonBarDemo,
          ],
        ),
      ),
    );
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _floatingActionButtonLabelDemo = FloatingActionButton.extended(
      tooltip: "Darren",
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text("Label"),
    );

    Widget _floatingActionButtonDemo = FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {},
      elevation: 0.0,
      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("New Page"),
      ),
      floatingActionButton: _floatingActionButtonDemo,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

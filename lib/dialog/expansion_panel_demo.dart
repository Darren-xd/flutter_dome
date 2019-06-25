import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    super.initState();
    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: "Panel A",
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text("Content for Panel A."),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: "Panel B",
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text("Content for Panel B."),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: "Panel C",
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text("Content for Panel C."),
        ),
        isExpanded: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionPanel"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (index, isExpanded) {
                setState(() {
                  _expansionPanelItems[index].isExpanded = !isExpanded;
                });
              },
              children: _expansionPanelItems.map((ExpansionPanelItem item) {
                return ExpansionPanel(
                  isExpanded: item.isExpanded,
                  body: item.body,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      child: Text(item.headerText),
                      padding: EdgeInsets.all(16.0),
                    );
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class ExpansionPanelItem extends StatelessWidget {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({this.headerText, this.body, this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

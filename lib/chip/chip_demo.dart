import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> labels = ["XUDE", "Darren", "Hello", "BUILD", "DEBUG"];
  List<String> _selected = ["XUDE"];
  String _choice = "";
  _chipItemList() {
    return labels.map((item) {
      return Chip(
        label: Text(item),
        avatar: Icon(
          Icons.ac_unit,
        ),
        deleteIcon: Icon(Icons.delete),
        onDeleted: () {
          setState(() {
            labels.remove(item);
          });
        },
      );
    }).toList();
  }

  _filterChipItemList() {
    return labels.map((item) {
      return FilterChip(
        label: Text(item),
        // avatar: Icon(Icons.ac_unit),
        selected: _selected.contains(item),
        onSelected: (value) {
          setState(() {
            if (_selected.contains(item)) {
              _selected.remove(item);
            } else {
              _selected.add(item);
            }
          });
        },
      );
    }).toList();
  }

  _actionChipItemList() {
    return labels.map((item) {
      return ActionChip(
        label: Text(item),
        onPressed: () {},
        elevation: 0.0,
      );
    }).toList();
  }

  _choiceChipItemList() {
    return labels.map((item) {
      return ChoiceChip(
        label: Text(item),
        avatar: Icon(Icons.account_circle),
        selected: _choice == item,
        onSelected: (value) {
          setState(() {
            _choice = item;
          });
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChipDemo"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            this.labels = ["XUDE", "Darren", "Hello", "BUILD", "DEBUG"];
            this._selected = [];
          });
        },
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("ChipDemo"),
            Wrap(
              spacing: 10.0,
              runSpacing: 0.0,
              children: _chipItemList(),
            ),
            Divider(
              indent: 10.0,
              height: 20.0,
              color: Colors.red,
            ),
            Text("FilterChipDemo"),
            Wrap(
              spacing: 10.0,
              runSpacing: 0.0,
              children: _filterChipItemList(),
            ),
            Divider(
              indent: 10.0,
              height: 20.0,
              color: Colors.red,
            ),
            Text("ActionChipDemo"),
            Wrap(
              spacing: 10.0,
              runSpacing: 0.0,
              children: _actionChipItemList(),
            ),
            Divider(
              indent: 10.0,
              height: 20.0,
              color: Colors.red,
            ),
            Text("ChoiceChipDemo"),
            Wrap(
              spacing: 10.0,
              runSpacing: 0.0,
              children: _choiceChipItemList(),
            )
          ],
        ),
      ),
    );
  }
}

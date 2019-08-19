import 'package:flutter/material.dart';

class ExpansionTileList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ExpansionTileListState();
  }
}

class _ExpansionTileListState extends State<ExpansionTileList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '2333',
      theme: new ThemeData(primaryColor: Colors.red),
      home: new Scaffold(
        appBar: new AppBar(title: new Text('List'),),
        floatingActionButton: FloatingActionButton(onPressed: () {
            Navigator.pop(context, 'Toast');
        }),
      ),
    );
  }
}

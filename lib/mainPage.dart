import 'package:flutter/material.dart';

class MyAppC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ABC',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Practice',),
        ),
        body: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(children: <Widget>[
                  Text('data1'),
                  Text('data2'),
                ],),
                Column(children: <Widget>[
                  Icon(Icons.done),
                  Text('done'),
                ],),
                Column(children: <Widget>[
                  Text('data1'),
                  Text('data2'),
                  Text('data3'),
                ],),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                ],
             ),
      ),
    );
  }
}
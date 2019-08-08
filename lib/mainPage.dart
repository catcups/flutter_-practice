import 'package:flutter/material.dart';

class MyAppC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ABC',
      home: Scaffold(
        appBar: AppBar(
          title: Text('DAssTA',),
        ),
        body: Center(
          child: Text('data'),
        ),
      ),
    );
  }
}
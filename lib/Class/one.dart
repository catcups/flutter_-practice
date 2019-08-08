import 'package:flutter/material.dart';

class PagesOne extends StatelessWidget {
  final String textData;
  PagesOne({Key key, @required this.textData}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageOne'),),
      // 接收上一界面的传值
      body: SizedBox.expand(child: Container(color: Colors.red, child: Text(textData),),),
      floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.pop(context, '233333333');
      }),
    );
  }
}
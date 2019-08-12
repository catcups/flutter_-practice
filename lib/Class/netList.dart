import 'package:flutter/material.dart';

class NetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShowNetPage();
  }
}


class ShowNetPage extends State<NetPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(title: Text('网络列表Demo'),),
        body: Text(
          'kankankankanakankana'
        ),
      ),
    );
  }
}
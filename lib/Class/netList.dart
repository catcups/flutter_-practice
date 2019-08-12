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
    // return MaterialApp(  // 类似切换rootVC 没有back  但是可以右滑pop
    //   home: new Scaffold(
    //     appBar: AppBar(title: Text('网络列表Demo'),),
    //     body: Text(
    //       'kankankankanakankana'
    //     ),
    //   ),
    // );
    return new Scaffold(   // 有back
        appBar: AppBar(title: Text('网络列表Demo'),),
        body: Text(
          'kankankankanakankana'
        ),
      );
  }
}
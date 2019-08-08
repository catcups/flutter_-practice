import 'package:flutter/material.dart';

void main()=>runApp(new HomeFrament());

class HomeFrament extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeFramentState();
  }
}

class _HomeFramentState extends State<HomeFrament> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 255, 123, 155)),
      home: Scaffold(
        appBar: AppBar(
        title: Row(children: <Widget>[
          // Image.asset('WX20190619-192036@2x'),
          ClipOval(
            child: Image.asset('WX20190619-192036@2x.png', width: 35.0, height: 35.0,),
          ),
          ClipOval(
            child: Image.asset("WX20190619-192036@2x.png", width: 15.0, height: 15.0,),
          )
          ,Text('data')
        ],),
        centerTitle: true,
        ),
      ),
    );
  }
}
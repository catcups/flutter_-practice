import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

void main()=>runApp(new HomeFrament());

class HomeFrament extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeFramentState();
  }
}

class _HomeFramentState extends State<HomeFrament> {
  bool isVisible=false;
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
          elevation: 0.0,
        title: Row(children: <Widget>[
          // Image.asset('WX20190619-192036@2x'),
          ClipOval(
            child: Image.asset('WX20190619-192036@2x.png', width: MediaQueryData.fromWindow(window).padding.top, height: 35.0,),
          ),
          Container(
            // alignment: Alignment(-.8, 0),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 13.0, right: 13.0),
            padding: EdgeInsets.only(left: 4.0),
            child: Icon(Icons.search, color: Colors.white,),
            width: 180,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
          ),
          Image.asset('WX20190619-192036@2x.png', width: MediaQueryData.fromWindow(window).padding.top, height: 35.0,),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Icon(Icons.settings_applications,
            color: Colors.white,),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Icon(
              Icons.message,
              color: Colors.white
            ),
          )
        ],),
        centerTitle: true,
        ),
        body: new ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 13.0),
              alignment: Alignment.center,
              color: Colors.white,
              height: 50,
              child:
              // width: MediaQueryData.fromWindow(window).padding.top,)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(children: <Widget>[
                  Text('直播',),
                  Container(height: 1.0,width: 30.0,color: Colors.redAccent,margin: EdgeInsets.only(top: 5.0),)
                ],),
                Column(children: <Widget>[
                  Text('直播'),
                  Container(height: 1.0,width: 30.0,color:isVisible?Colors.redAccent:Colors.white,margin: EdgeInsets.only(top: 5.0),)
                ],),
                Column(children: <Widget>[
                  Text('直播'),
                  Container(height: 1.0,width: 30.0,color:isVisible?Colors.redAccent:Colors.white,margin: EdgeInsets.only(top: 5.0),)
                ],),
                Column(children: <Widget>[
                  Text('直播'),
                  Container(height: 1.0,width: 30.0,color:isVisible?Colors.redAccent:Colors.white,margin: EdgeInsets.only(top: 5.0),)
                ],),
                Column(children: <Widget>[
                  Text('直播'),
                  Container(height: 1.0,width: 30.0,color:isVisible?Colors.redAccent:Colors.white,margin: EdgeInsets.only(top: 5.0),)
                ],),
              ],
            )
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: prefix0.Image.asset('images/20190802190018_ZML4A.jpeg', width: MediaQuery.of(context).size.width,),
            )
          ],
        ),
      ),
    );
  }
}
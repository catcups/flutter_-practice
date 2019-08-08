import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/Class/one.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:oktoast/oktoast.dart';

class MyAppC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FirstPage();  
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: AppBar(
          title: Text('Flutter Practice',),
        ),
        body: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(children: <Widget>[
                  Icon(Icons.done),
                  new CupertinoButton(
                  child: Text('点击'), 
                  onPressed: () {
                    // Navigator.pushNamed(context, '/one');
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return PagesOne(textData: 'zhiPush',);
                    })).then((value){print(value);});
                  },
                  color: Colors.red,
                ),
                ],),
                Column(children: <Widget>[
                  new CupertinoButton(
                  child: Text('点击'), 
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return new MaterialApp(
                        title: '2333',
                        theme: new ThemeData(primaryColor: Colors.red),
                        home: new Scaffold(
                          appBar: new AppBar(title: new Text('233344'),),
                          floatingActionButton: FloatingActionButton(onPressed: () {
                             Navigator.pop(context, 'Toast');
                          }),
                        ),
                      );
                    })).then((value){
                      Fluttertoast.showToast(
                      msg: value,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Color(0xFF9E9E9E),
                      textColor: Color(0xFFffffff));
                    });
                  },
                  color: Colors.red,
                ),
                new CupertinoButton(
                  child: Text('点击'), 
                  onPressed: () {
                    log('message');
                  },
                  color: Colors.red,
                ),
                new CupertinoButton(
                  child: Text('点击'), 
                  onPressed: () {
                    log('message');
                  },
                  color: Colors.red,
                ),
                new CupertinoButton(
                  child: Text('点击'), 
                  onPressed: () {
                    log('message');
                  },
                  color: Colors.red,
                )])
                ],
          ),
    );
  }
}
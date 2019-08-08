import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/Class/one.dart';

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
                             Navigator.pop(context, '233333333');
                          }),
                        ),
                      );
                    })).then((value){print(value);});
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
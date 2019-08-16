import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/Class/TabBar.dart';
import 'package:flutter_practice/Class/editText.dart';
import 'package:flutter_practice/Class/login.dart';
import 'package:flutter_practice/Class/netList.dart';
import 'package:flutter_practice/Class/one.dart';
import 'package:flutter_practice/home.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:oktoast/oktoast.dart';

class MyAppC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FirstPage();  
  }
}

class FirstPage extends StatelessWidget {
    // 使用构造创建
  var list1 = new List();
  //创建一个int类型的list
  List intlist = [1, 2, 3];
  // 创建一个常量List， 不可以改变的List
  List constList = const['10', 7, 23];
   //  在数组中可以存放多个不同类型的对象
  var list = ['push传值', '点击', '点击', '点击', '点击', 
              '点击', '点击', '点击', '点击', '点击', 
              '点击', '点击', '点击', '点击', '点击', 
              '点击', '点击', '点击', '点击', '点击'];

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
                  child: Text('点击push'),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/one');
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return PagesOne(textData: '传值',);
                    })).then((value){print(value);});
                  },
                  color: Colors.red,
                ),
                ],),
                // ListView.builder(
                //   itemBuilder: (context, index) {
                //   return Column(children: <Widget>[
                //   Icon(Icons.done),
                //   new CupertinoButton(
                //   child: Text('点击'), 
                //   onPressed: () {
                //     // Navigator.pushNamed(context, '/one');
                //     Navigator.of(context).push(MaterialPageRoute(builder: (context){
                //       return PagesOne(textData: '传值',);
                //     })).then((value){print(value);});
                //   },
                //   color: Colors.red,
                // ),
                // ],);
                // },itemCount: 2,),
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
                      // Navigator.pushNamed(context, '/one');
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return PagesTwo(textData: '233',);
                      })).then((value){print(value);});
                    },
                    color: Colors.red,
                  ),
                  new CupertinoButton(
                    child: Text('点击2'), 
                    onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return new Scaffold(
                            appBar: new AppBar(title: new Text('23ssdw'),),
                            floatingActionButton: FloatingActionButton(onPressed: () {
                                Navigator.pop(context, '23ssdd');
                            }),
                      );
                      })).then((value){
                        Fluttertoast.showToast(
                        msg: 'value23ss',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIos: 1,
                        backgroundColor: Color(0xFF9E9E9E),
                        textColor: Color(0xFFffffff));
                      });
                    },
                    color: Colors.red,
                  ),
                  new CupertinoButton(
                    child: Text('Login'), 
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return MyAppF();
                      }));
                    },
                    color: Colors.red,
                  ),
                  new CupertinoButton(
                    child: Text('网络列表'), 
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return NetPage();
                      }));
                    },
                    color: Colors.red,
                  ),
                  new CupertinoButton(
                    child: Text('布局'), 
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return HomeFrament();
                      }));
                    },
                    color: Colors.red,
                  ),
                  new CupertinoButton(
                    child: Text('输入'), 
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return EditTextWidget();
                      }));
                    },
                    color: Colors.red,
                  ),
                  new CupertinoButton(
                    child: Text('TabBar'), 
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return MainTabBar();
                      }));
                    },
                    color: Colors.red,
                  ),
                  ])
                ],
          ),
    );
  }
}
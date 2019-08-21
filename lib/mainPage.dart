import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/Class/ExpansionTile.dart';
import 'package:flutter_practice/Class/ListViewHeader.dart';
import 'package:flutter_practice/Class/TabBar.dart';
import 'package:flutter_practice/Class/editText.dart';
import 'package:flutter_practice/Class/login.dart';
import 'package:flutter_practice/Class/netList.dart';
import 'package:flutter_practice/Class/one.dart';
import 'package:flutter_practice/home.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:oktoast/oktoast.dart';

import 'Class/ChangeList.dart';

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
  var list = ['push传值', '网络搜索', '点击1', '点击2', 'Login', 
              '网络列表', '布局', '输入', 'TabBar', '更新List', 
              'ListViewHeader', '点击11', '点击12', '点击13', '点击14', 
              '点击15', '点击16', '点击17', '点击18', '点击2333'];
  var widgets = [];

  @override
  Widget build(BuildContext context) {
    widgets = buildMainTileList(context);
      return new Scaffold(
        appBar: AppBar(
          title: Text('Flutter Practice',),
        ),
        body: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Container(
                //   width:MediaQuery.of(context).size.width / 2,
                //   child:Column(children: buildMainTileList(context))
                // ),
                Column(children: <Widget>[
                  Icon(Icons.done),
                  new CupertinoButton(
                  child: Text(list[0]),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/one');
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return PagesOne(textData: list[0],);
                    })).then((value){print(value);});
                  },
                  color: Colors.red,
                ),
                ],),
                Container(
                  width:MediaQuery.of(context).size.width / 2,
                  child:
                  ListView.builder(
                    itemBuilder: (context, index) {
                    // return buildMainTileList(context)[index]; // 不适用 多次创建widget了
                    return widgets[index];
                  },itemCount: list.length-1,),
                  )
                ],
          ),
    );
  }

  List<Widget> buildMainTileList(BuildContext context) {
    List<Widget> widgetList = new List();
      for (int i = 1; i < list.length; i++) {
        // print('\n创建widget $i');
        widgetList.add(
          Container(
            margin: EdgeInsets.all(5),
            child: new CupertinoButton(
              child: Text(list[i]), 
              onPressed: () {
                pushNext(context, i);
              },
              color: Colors.red,
            )
          )
        );
      }
    return widgetList;
  }

  pushNext(BuildContext context, int index) {
    switch (index) {
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return ExpansionTileList();
                    })).then((value){
                      Fluttertoast.showToast(
                      msg: value,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Color(0xFF9E9E9E),
                      textColor: Color(0xFFffffff));
                    });
        break;
      case 2:
        // Navigator.pushNamed(context, '/one');
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return PagesTwo(textData: '233',);
        })).then((value){print(value);});
        break;
      case 3:
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
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return MyAppF();
                      }));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return NetPage();
                      }));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return HomeFrament();
            }));
        break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return EditTextWidget();
            }));
        break;
      case 8:
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return MainTabBar();
            }));
        break;
      case 9:
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return NetChangeList();
            }));
        break;
      case 10:
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return NewsListPage();
            }));
        break;
      case 11:
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return EditTextWidget();
            }));
        break;
      case 12:
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return EditTextWidget();
            }));
        break;
      case 13:
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return EditTextWidget();
            }));
        break;
      case 14:
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return EditTextWidget();
            }));
        break;
      case 15:
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return EditTextWidget();
            }));
        break;
      default:
    }
  }

}
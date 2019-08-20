import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class NetChangeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NetChangeStates();
  }
}

class NetChangeStates extends State<NetChangeList> {
  // List list=[]; // != null
  List list;  // == null

 @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      // body: new ListView(children: _getListData()),
      body: ListView.builder(
            itemCount: list == null ? 0 : list.length,
            itemBuilder: (BuildContext context, int position) {
              return _getListDate(context, position);
        }),
    );
  }
 
  initState() {
    _getdata();
    super.initState();
  }

  _getListData() {
    List<Widget> widgets = [];
    for (int i = 0; i < 100; i++) {
      widgets.add(new Padding(padding: new EdgeInsets.all(10.0), child: new Text("Hello, world.")));
    }
    return widgets;
  }
  
      
  Widget _getListDate(BuildContext context, int position) {
    if (list != null) {
        return GestureDetector(
          onTap: () {
            var list;
            print(list[position]);
          },
          child: Center(
              child: new Container(
                  width: MediaQueryData.fromWindow(window).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(top: 2.0),
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Center(child: new Text(list[position])))),
        );
    }
  }
  
  _getdata() async {
    if (list != null) {
      return;
    }
    Future.delayed(const Duration(seconds:1), () => print('1秒后在Event queue中运行的Future'));

    var lis = [];
    Future.delayed(const Duration(seconds:1), () {
      for (int i = 0; i < 100; i++) {
        lis.add("Hello, world.");
      }
      list = lis;
      setState(() {
        // 刷新
      });
    });
  //  // 创建一个HTTP client
  //   var httpClient = new HttpClient();
  //   //创建一个url Uri.http();这里指定的是http请求,也可以https.可以看见第一个参数给的时候没有加上http://,加了会报错.第三个参数带上了请求Parameter.
  //   var url = new Uri.http('api.xxx.xxx', '/config/profession',
  //       {'accessToken': 'xxxxxxxxxxxx'});
  //   var requset = await httpClient.getUrl(url);
  //   var close = await requset.close();
  //   var boby = await close.transform(utf8.decoder).join();
  //   //JSON解析拿到数据.
  //   Map mapJson = json.decode(boby);
  //   //拿到listview列表的数据.
  //   list = mapJson['data'];
  //   print(json.decode(boby));
    //更新视图
  }
}
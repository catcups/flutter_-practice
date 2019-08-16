import 'package:flutter/material.dart';
import 'package:flutter_practice/Class/netList.dart';

class MainTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainTabBarState();
  }
}

class _MainTabBarState extends State<MainTabBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body:
    DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 1),
            width: 600,
            height: 60,
            color: Colors.white,
            child: TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.yellow,
              indicatorWeight: 2,
              isScrollable: false,
              labelStyle: TextStyle(fontSize: 14),
              tabs: <Widget>[
                Tab(text: 'AAA',),
                Tab(text: 'BBB',),
                Tab(text: 'CCC',),
                Tab(text: 'DDD',),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: <Widget>[
                Page111(),
                NetPage3(),
                Page111(),
                NetPage3()
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class Page111 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 200,
      height: 444,
      child: Text('data', style: TextStyle(fontSize: 20, color: Colors.red),),
    );
  }
  
}
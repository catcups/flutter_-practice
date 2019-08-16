import 'package:flutter/material.dart';
import 'package:flutter_practice/Class/netList.dart';

class MainTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _mainTabBar;
  }
}

class _mainTabBar extends State<MainTabBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 1),
            width: 750,
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
                NetPage3(),
                NetPage3(),
                NetPage3(),
                NetPage3()
              ],
            ),
          )
        ],
      ),
    );
  }
}
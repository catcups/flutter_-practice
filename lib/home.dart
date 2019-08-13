import 'dart:ui';
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
          Stack(
            alignment: Alignment(1.0, -1.0),
            children: <Widget>[
            ClipOval(
              child: Image.asset('WX20190619-192036@2x.png', width: MediaQueryData.fromWindow(window).padding.top, height: 35.0,),
            ),
            Container(
              width: 10.0,height: 10.0,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5)
              ),
            )
          ],),
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
            Padding(
              padding: EdgeInsets.all(10.0),
              child:ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Image.asset('images/20190802190018_ZML4A.jpeg', width: MediaQuery.of(context).size.width, height: 120,fit: BoxFit.cover,),
              )
            ),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                return Container(
                  color: Colors.redAccent,
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: buildGridTileList(5),
                  ),
                );
              }, itemCount: 2,)
            ),
            Container(height: 1.0,color: Colors.black12,),
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0), // 这行代码高度约等于直接设置// height: 44.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text('我就看看'),
                  ),
                  Text('啥子哟',
                  style:TextStyle(color: Colors.black26)),
                  Text('啥子哟',
                  style:TextStyle(color: Colors.black12)),
                  Text('啥子哟',
                  style:TextStyle(color: Colors.black26)),
                  Icon(Icons.navigate_next, color: Colors.black26,)
                ],
              ),
            ),
            Container(height: 1.0,color: Colors.black12,),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              height: 44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('瞧一瞧'),
                  Row(
                    children: <Widget>[
                      Text('看一看啦'),
                      Icon(Icons.refresh, size: 20.0,)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 600,child:
            GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.18), itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child:Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        child: Image.asset('images/20190803115834_deyyR.jpeg', width: MediaQuery.of(context).size.width, height: 120,fit: BoxFit.cover,),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        Text('kankan', style: TextStyle(color: Colors.redAccent),),
                        Row(children: <Widget>[
                          Icon(Icons.perm_identity, color: Colors.redAccent,),
                          Text('999万人', style: TextStyle(color: Colors.redAccent),)
                        ],)],),)
                    ],)
                  ),
                  Text('Test == $index'),
                  Text('SubTest == $index', style: TextStyle(color: Colors.black26),),
                ],
              ));
            }, itemCount: 12,))
          ],
        ),
      ),
    );
  }

  List<Widget> buildGridTileList(int number) {
      List<Widget> widgetList = new List();
        for (int i = 0; i < number; i++) {
          widgetList.add(_setListData());
        }
      return widgetList;
  }

  Widget _setListData() {
    return Column(
            children: <Widget>[
              Container(
                child: Image.asset('images/20190802190018_ZML4A.jpeg', width: 50.0, height: 50.0, fit: BoxFit.fill,),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text('data',),
              )
            ],
          );
  }

}
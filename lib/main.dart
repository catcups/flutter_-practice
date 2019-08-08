import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';

void main() => runApp(HomeFrament());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.add),
          title: Text('23333'),
        ),
        body: new ListView(
          children: <Widget>[
            Container(
              color: Colors.green,
              child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(children: <Widget>[
                  Text('data1'),
                  Text('data2'),
                ],),
                Column(children: <Widget>[
                  Icon(Icons.done),
                  Text('done'),
                ],),
                Column(children: <Widget>[
                  Text('data1'),
                  Text('data2'),
                  Text('data3'),
                ],),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                ],
             ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(children: <Widget>[
                  Text('data1'),
                  Text('data2'),
                ],),
                Column(children: <Widget>[
                  Icon(Icons.done),
                  Text('done'),
                ],),
                Column(children: <Widget>[
                  Text('data1'),
                  Text('data2'),
                  Text('data3'),
                ],),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                ],
             ),

              new Row(children: <Widget>[
                Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.red,
                  margin: EdgeInsets.only(left: 10.0),
                  // padding: EdgeInsets.all(0.0),
                  child:Icon(Icons.settings_overscan, size: 80.0,),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(children: <Widget>[
                  Text('标题'),
                  Text('Content'),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                ButtonBar(children: <Widget>[
                  Icon(Icons.add),
                  Text('dianji'),
                ],
                alignment: MainAxisAlignment.center,),
              ],
              crossAxisAlignment:CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
            ),

            Container(
              color: Colors.yellow,
              child:
            new Row(children: <Widget>[
              Flexible(
                child: Icon(Icons.settings_overscan, size: 80.0,),
                flex: 1,
              ),
              Flexible(
                
                child: Container(
              color: Colors.blue,
              child:
              Column(children: <Widget>[
                  Text('标题'),
                  Text('Content'),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
                flex: 2,
              ),
                
                Flexible(
                  child: ButtonBar(children: <Widget>[
                  Icon(Icons.add),
                  Text('dianji'),
                  ],
                  alignment: MainAxisAlignment.center,),
                  flex: 2,
                )
              ],
              crossAxisAlignment:CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),)
          ],
        ),
      ),
    );
  }
}

class MyAppB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABC',
      home: Scaffold(
        body: Center(
          child: Container(
            child: new Text('hello ABC', style:TextStyle(fontSize:40.0)),
            alignment: Alignment.topLeft,
            width: 500.0,
            height: 500.0,
            // color: Colors.lightBlue,
            padding: const EdgeInsets.fromLTRB(10.0,0,100,0),
            margin: const EdgeInsets.all(20.0),
            decoration: new BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.red, Colors.blue, Colors.purple]
              ),
              border: Border.all(width: 5.0, color: Colors.black), 
            ),
          ),
        ),
      ),
    );
  }
}


class MyAppA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABC',
      home: Scaffold(
        body: Center(
          child: Text('Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。我们将在这里揭开他可爱而神奇的面纱。',
          textAlign: TextAlign.right,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 25.0,
            color: Color.fromARGB(255, 255, 122, 122),
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dashed,
          ),),
        ),
      ),
    );
  }
}
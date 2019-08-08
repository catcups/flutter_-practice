import 'package:flutter/material.dart';

class PagesOne extends StatelessWidget {
  final String textData;
  PagesOne({Key key, @required this.textData}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageOne'),),
      // 接收上一界面的传值
      body: SizedBox.expand(child: Container(color: Colors.red, child: Text(textData),),),
      floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.pop(context, '233333333');
      }),
    );
  }
}


class PagesTwo extends StatelessWidget {
  final String textData;
  PagesTwo({Key key, @required this.textData}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TwoPage'),),
      // 接收上一界面的传值
      body: ListView(
      // padding: EdgeInsets.all(10.0),
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Text(textData,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
          ),),
        ),
        Image.network('https://github.com/niyongsheng/NYSMC/raw/master/logo.png?raw=true',
        scale: 1.0,
        width: 100.0,
        height: 100.0,),
        Container(
          padding: EdgeInsets.all(10.0),
          child: new ListTile(
          leading: Image.network('https://github.com/niyongsheng/NYSMC/raw/master/logo.png?raw=true'),
          title: Text('ABBBCCCSDDD'),
          subtitle: Text('datadadw'),
          trailing: Icon(Icons.check_circle),
          onTap: (){},
          ),
          height: 44,
        ),
        ListTile(
          leading: Image.network('https://github.com/niyongsheng/NYSMC/raw/master/logo.png?raw=true'),
          title: Text('ABBBCCCSDDD'),
          subtitle: Text('datadadw'),
          trailing: Icon(Icons.check_circle),
          onTap: (){},
        ),
        ListTile(
          leading: Image.network('https://github.com/niyongsheng/NYSMC/raw/master/logo.png?raw=true'),
          title: Text('ABBBCCCSDDD'),
          subtitle: Text('datadadw'),
          trailing: Icon(Icons.check_circle),
          onTap: null,
        ),
        ListTile(
          leading: Image.network('https://github.com/niyongsheng/NYSMC/raw/master/logo.png?raw=true'),
          title: Text('ABBBCCCSDDD'),
          subtitle: Text('datadadw'),
          trailing: Icon(Icons.check_circle),
          onTap: null,
        ),
        ListTile(
          leading: Image.network('https://github.com/niyongsheng/NYSMC/raw/master/logo.png?raw=true'),
          title: Text('ABBBCCCSDDD'),
          subtitle: Text('datadadw'),
          trailing: Icon(Icons.check_circle),
        ),
        ListTile(
          leading: Image.network('https://github.com/niyongsheng/NYSMC/raw/master/logo.png?raw=true'),
          title: Text('ABBBCCCSDDD'),
          subtitle: Text('datadadw'),
          trailing: Icon(Icons.check_circle),
          onTap:(){print('2333');},
          onLongPress:(){print('23334444444444');},
        ),
        // PageView(
        //   children: <Widget>[
        //     Text('data'),
        //     Text('data'),
        //   ],
        // ),
      ],),
    );
  }
}
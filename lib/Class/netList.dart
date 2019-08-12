import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/main.dart';


// => 它是用于单行函数或方法的简写
// void runApp(Widget app) ：将指定控件显示在屏幕上
// StatelessWidget : 状态不需要经常变化的控件
// StatefulWidget：状态可经常变化的控件
// State ：[StatefulWidget]的逻辑和内部状态。

// 第一种
class NetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShowNetPage();
  }
}


class ShowNetPage extends State<NetPage> {
  List<int> items = List.generate(20, (i) => i); // 产生数据
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false; // 是否有请求正在进行


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  //   // return MaterialApp(  // 类似切换rootVC 没有back  但是可以右滑pop
  //   //   home: new Scaffold(
  //   //     appBar: AppBar(title: Text('网络列表Demo'),),
  //   //     body: Text(
  //   //       'kankankankanakankana'
  //   //     ),
  //   //   ),
  //   // );
    return new Scaffold(   // 有back
        appBar: AppBar(title: Text('网络列表Demo'),),
        body: ListView.builder(
        itemCount: items.length + 1, // 进度组件添加到我们的ListView
        itemBuilder: (context, index) {
          if (index == items.length) {
            // 进度组件添加到我们的ListView
            return _buildProgressIndicator();
          } else {
            return ListTile(title: new Text("Number $index"),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return NetPage3();
                    }));
            },);
          }
        },
        controller: _scrollController,
      ),
    );
  }

  /// from - 包括, to - 不包括
  /// 通过这个模拟http请求
  Future<List<int>> fakeRequest(int from, int to) async {
  // 如果对Future不熟悉，可以参考 https://juejin.im/post/5b2c67a351882574a756f2eb
  return Future.delayed(Duration(seconds: 2), () {
    return List.generate(to - from, (i) => i + from);
  });
  }

// 不处理空数据情况
  // _getMoreData() async {
  //   if (!isPerformingRequest) { // 判断是否有请求正在执行
  //     setState(() => isPerformingRequest = true);
  //     List<int> newEntries = await fakeRequest(items.length, items.length + 10);
  //     setState(() {
  //       items.addAll(newEntries);
  //       isPerformingRequest = false;// 下一个请求可以开始了
  //     });
  //   }
  // }

  // 处理空数据情况
  _getMoreData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      List<int> newEntries = await fakeRequest(items.length, items.length); //returns empty list
      if (newEntries.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent - _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge -offsetFromBottom),
              duration: new Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      }
      setState(() {
        items.addAll(newEntries);
        isPerformingRequest = false;
      });
    }
  }

// 下拉加载的进度提示
  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }


}





// 第二种
class NetPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShowNetPage2();
  }
}


class ShowNetPage2 extends State<NetPage2> {


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(   // 有back
        // appBar: AppBar(title: Text('网络列表Demo'),),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar( // 向上滑动附带隐藏导航
              floating: false,
              title: Text('CustomScrollView'),
            ),
            new SliverPadding(
              padding: const EdgeInsets.all(10.0),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate(
                  <Widget>[
                    Text('Number (2+2)'),
                    Column(
                      // children: <Widget>[],
                      children: buildListData(10)
                    ),
                  ],
                ),
              ),
            )
          ],
      ),
    );
  }


  List<Widget> buildListData(int number) {
      List<Widget> widgetList = new List();
        for (int i = 0; i < number; i++) {
          if (i == 2) {
            widgetList.add(new GestureDetector(
                        child: Text(' - ', textAlign: TextAlign.left, style: TextStyle(fontSize: 40, backgroundColor: Colors.red, color: Colors.black),),
                        onTap: () {
                          print('object ---');
                        },
                      ),);
          } else if (i == 5) {
            widgetList.add(GestureDetector(
                        child: Text(' + ', textAlign: TextAlign.right, style: TextStyle(fontSize: 40, backgroundColor: Colors.red, color: Colors.black),),
                        onTap: () {
                          print('object +++');
                        },
                      ));
          } else {
                widgetList.add(new GestureDetector(
                  onTap: () {
                    //处理点击事件
                    print('object == $i');
                  },
                  child: new Container(
                    padding: const EdgeInsets.all(8.0),
                    child: new Image.network("https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=495625508,"
          "3408544765&fm=27&gp=0.jpg")
                  ),
                ));
          }
        }
      return widgetList;
    }
}




// 第三种
class NetPage3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShowNetPage3();
  }
}


class ShowNetPage3 extends State<NetPage3> {
  List<int> items = List.generate(10, (i) => i); // 产生数据


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(   // 有back
        appBar: AppBar(title: Text('列表Demo'),),
        body: 
          //new ListView.builder(itemCount: 40, itemBuilder: buildItem),  
            buildGridView(),
    );
  }

  //ListView的Item
  Widget buildItem(BuildContext context, int index) {
    //设置分割线
    if (index.isOdd) return new Divider();
    //设置字体样式
    TextStyle textStyle =
        new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0);
    //设置Padding
    return new GestureDetector(
      onTap: () {
        //处理点击事件
      },
      child: new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Text("xhu_ww", style: textStyle),
      ),
    );
  }


    Widget buildGridView() => 
    new GridView.count(
      primary: false,
      padding: const EdgeInsets.all(8.0),
      mainAxisSpacing: 8.0,//竖向间距
      crossAxisCount: 2,//横向Item的个数
      crossAxisSpacing: 8.0,//横向间距
      children: buildGridTileList(11),
      );

    List<Widget> buildGridTileList(int number) {
      List<Widget> widgetList = new List();
        for (int i = 0; i < number; i++) {
          widgetList.add(getItemWidget());
        }
      return widgetList;
    }

    String url =
      "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=495625508,"
      "3408544765&fm=27&gp=0.jpg";
    Widget getItemWidget() {
    //BoxFit 可设置展示图片时 的填充方式
      return new GestureDetector(
        onTap: () {
          //处理点击事件
          Navigator.of(context).push(MaterialPageRoute(builder: (context){ return NetPage2(); }));
          //使用flutter 自带的 showDialog 方法展示Dialog
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //   getDialog();
          // });
        },
        child: new Container(
          padding: const EdgeInsets.all(8.0),
          child: new Image(image: new NetworkImage(url), fit: BoxFit.cover),
        ),
      );
    }


    // AlertDialog
    Widget getDialog() {
      return new AlertDialog(
        title: new Text("点击提示"),
        content: new SingleChildScrollView(
            child: new ListBody(children: <Widget>[new Text("你点击了Item")])),
        actions: <Widget>[ 
          new FlatButton(
            child: new Text("取消"),
            onPressed: () {//按钮点击事件
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text("确认"),
            onPressed: () { 
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }


}
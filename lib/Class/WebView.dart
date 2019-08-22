import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice/Class/WebView_demo.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class TextFieldPage extends StatefulWidget {
  TextFieldPage({Key key}) : super(key: key);

  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        child: child,
//     );
//   }
// }

// class TextFieldPage extends StatelessWidget {
  var _textEditingController = new TextEditingController();
  FocusNode _contentFocusNode = FocusNode();
  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.topStart;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('baidu:''3'),),
        body: Center(
          child: Column(
            children: _buildCenterWidget(context)
          ),
        ),
      ),
    );
  }

  // 输入框加按钮
  List <Widget> _buildCenterWidget(BuildContext context) {
    return [
      new TextField(
            decoration: new InputDecoration(
                hintText: "请输入百科名字查询",
                labelText: "百科",
                helperText: "名字输入",
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.solid),
                ),
              prefixIcon: new Icon(Icons.receipt),
              prefixText: "prefixText",
              prefixStyle: TextStyle(fontSize: 20.0,color: Colors.red),
              counterText: "counterText",
              counterStyle: TextStyle(fontSize: 20.0,color: Colors.blue),
              filled: true,
              fillColor: Colors.cyanAccent,
              semanticCounterText: "semanticCounterText"
            ),
            controller: _textEditingController,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            textCapitalization: TextCapitalization.sentences,
            focusNode: _contentFocusNode,
          ),

          MaterialButton(
          child: new Text("搜索",
              style: new TextStyle(
                  color: Colors.amber,
                  fontSize: 15.00,
                  letterSpacing: 5.00)),
          color: Colors.teal[500],
          onPressed: () {
            _contentFocusNode.unfocus();
            if (_textEditingController.text == '') {
              print('动漫新番');
              String url = 'https://baike.baidu.com/item/' + '动画新番';
              print(this._alignmentDirectional);
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return FlutterWebView(url: url, barTitle: '233',);
              }));
            }
            if (_textEditingController.text != '') {
              print(_textEditingController.text);
              String url = 'https://baike.baidu.com/item/' + _textEditingController.text;
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return FlutterWebView(url: url, barTitle: '233',);
                // return Widget_WebView_Page();
              }));
            }
          },
        ),
        _getButtonBar(context),
        _buildWrap(),
        _buildTapWrap()
    ];
  }

  // StatefulWidget 类型的不用传context
  // StatelessWidget 则需要传(BuildContext context)
  Widget _getButtonBar(BuildContext context) {
    const kAlignmentType = <String, AlignmentDirectional> {
      'webType1':AlignmentDirectional.topStart,
      'webType2':AlignmentDirectional.topCenter,
    };
    // return Material(
    //   color: Theme.of(context).primaryColorLight,
    //   child: 
    return  Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(title: Text('webType'),
          trailing: DropdownButton<AlignmentDirectional>(
            value: _alignmentDirectional,
            onChanged: (AlignmentDirectional newValue) {
              if (newValue != null) {
                setState(() => this._alignmentDirectional = newValue);
              }
            },
            items: kAlignmentType.map((String name,AlignmentDirectional val) => MapEntry(
                name, 
                DropdownMenuItem(value: val,child: Text(name)))
                ).values.toList()
            ),
          ),
        ],
      );
    // );
  }

  Widget _buildWrap() {
    return Wrap(
      // Gap between adjecent chips.
      spacing: 8,
      // Gap between lines.
      runSpacing: 4,
      direction: Axis.horizontal,
      children: [
        '动漫新番',
        '妖精的尾巴',
        '银魂'
      ].map(
        (String name) => Chip(
          avatar:CircleAvatar(child: Text(name.substring(0, 1))),
          label: Text(name),
          onDeleted: name == '妖精的尾巴' ? null : () => print('object'),
        )
      ).toList(),
    );
  }

  Widget _buildTapWrap() {
    return Wrap(
      // Gap between adjecent chips.
      spacing: 8,
      // Gap between lines.
      runSpacing: 4,
      direction: Axis.horizontal,
      children: [
        '动漫新番',
        '妖精的尾巴',
        '银魂',
        '海贼王',
        '火影',
        '刀剑神域',
      ].map(
        (String name) => GestureDetector(
          onTap: (){
            print('$name');
          },
          child: Chip(
            // avatar:CircleAvatar(child: Text(name.substring(0, 0))),
            shadowColor: Colors.redAccent,
            label: Text(name),
          ),
        )
      ).toList(),
    );
  }

}


class Widget_WebView_Page extends StatefulWidget {
  Widget_WebView_Page({Key key}) : super(key: key);

  _Widget_WebView_PageState createState() => _Widget_WebView_PageState();
}

class _Widget_WebView_PageState extends State<Widget_WebView_Page>
    with SingleTickerProviderStateMixin {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var title = "WebView组件";
  var tabs;
  TabController controller;
  var choiceIndex = 0;

  //获取h5页面标题
  Future<String> getWebTitle() async {
    String script = 'window.document.title';
    var title = await
    flutterWebviewPlugin.evalJavascript(script);
    setState(() {
      this.title = title;
      print('####################   $title');
    });
  }

  @override
  void initState() {
    super.initState();

    /**
     * 监听web页加载状态
     */
//     flutterWebviewPlugin.onStateChanged.listen((
//         WebViewStateChanged webViewState) async {
// //      setState(() {
// //        title = webViewState.type.toString();
// //      });
//       switch (webViewState.type) {
//         case WebViewState.finishLoad:
//           handleJs();

//           getWebTitle();

//           break;
//         case WebViewState.shouldStart:
//           break;
//         case WebViewState.startLoad:
//           break;
//         case WebViewState.abortLoad:
//           break;
//       }
//     });

    /**
     * 监听页面加载url
     */
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
//      getWebTitle(url: url);

//      setState(() {
//        title = url;
//      });
    });

    /**
     * 监听x轴滑动距离
     * 好像没什么用
     */
//    flutterWebviewPlugin.onScrollXChanged.listen((double offsetX) {
//      title = offsetX.toString();
//    });

//    flutterWebviewPlugin.onScrollYChanged.listen((double offsetY) {
//      title = offsetY.toString();
//    });

    tabs = <Widget>[
      Tab(
        child: GestureDetector(
          child: Text("刷新"),
          onTap: () {
            flutterWebviewPlugin.reload();
          },
        ),
      ),
      Tab(
        child: GestureDetector(
          child: Text("返回"),
          onTap: () {
            flutterWebviewPlugin.goBack();
          },
        ),
      ),
      Tab(
        child: GestureDetector(
          child: Text("加载指定url"),
          onTap: () {
            flutterWebviewPlugin.reloadUrl("https://www.360.com");
          },
        ),
      ),
    ];
    controller =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "http://www.baidu.com",
      //默认加载地址
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.grey,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            flutterWebviewPlugin.close();
          },
        ),
        bottom: TabBar(
          tabs: tabs,
          controller: controller,
          indicatorColor: Colors.red,
        ),
        actions: <Widget>[
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "首页", /*style: TextStyle(color: Color(0xff333333)),*/),
              activeIcon: Icon(
                Icons.home,
                color: Color(0xffDE331F),
//                size: 30.0,
              ),
              backgroundColor: Color(0xffff0000),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.devices_other),
              title: Text(
                "其他", /*style: TextStyle(color: Color(0xff333333)),*/),
              activeIcon: Icon(
                Icons.devices_other,
                color: Color(0xffDE331F),
//                size: 30.0,
              ),
              backgroundColor: Color(0xffff0000),
            ),
          ],
          currentIndex: choiceIndex,
          fixedColor: Color(0xffDE331F),
//          iconSize: 30.0,
//          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (index == 0) {
              setState(() {
                choiceIndex = 0;
                flutterWebviewPlugin.reloadUrl("https://www.qq.com/");
              });
            } else {
              setState(() {
                flutterWebviewPlugin.reloadUrl("https://www.alipay.com/");
                choiceIndex = 1;
              });
            }
          }

      ),
      scrollBar: false,
      withZoom: false,
    );
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  void handleJs() {
    flutterWebviewPlugin.evalJavascript(
        "abc(${title}')")
        .then((result) {

    });
  }
}


/**
 *
 * const WebviewScaffold({
    Key key,
    this.appBar,
    @required this.url,
    this.headers,//
    this.withJavascript,//是否允许执行js代码
    this.clearCache,//
    this.clearCookies,//
    this.enableAppScheme,//
    this.userAgent,//
    this.primary = true,//
    this.persistentFooterButtons,//
    this.bottomNavigationBar,//
    this.withZoom,//是否允许网页缩放
    this.withLocalStorage,//是否允许LocalStorage
    this.withLocalUrl,//
    this.scrollBar,//是否显示滚动条
    this.supportMultipleWindows,//
    this.appCacheEnabled,//
    this.hidden = false,//
    this.initialChild,//
    this.allowFileURLs,//
    this.resizeToAvoidBottomInset = false,//
    this.invalidUrlRegex,//
    this.geolocationEnabled//
    })
 */

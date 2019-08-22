import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TextFieldPage extends StatelessWidget {
  var _textEditingController = new TextEditingController();
  FocusNode _contentFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('baidu:'''),),
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
              String url = 'https://baike.baidu.com/item/' + '动漫新番';
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Scaffold(
                appBar: AppBar(title: Text('data'),),
                body: _showWebView(context, url),
              );
                return Widget_WebView_Page();
              }));
            }
            if (_textEditingController.text != '') {
              print(_textEditingController.text);
              String url = 'https://baike.baidu.com/item/' + _textEditingController.text;
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
              //   return Scaffold(
              //   body: _showWebView(context, url),
              // );
                return Widget_WebView_Page();
              }));
            }
          },
        ),
    ];
  }



  final Completer<WebViewController> _controller = Completer<WebViewController>();


  ///初始化webview显示
  Widget _showWebView(BuildContext context, String url) {
    return WebView(
      initialUrl: url,///初始化url
      javascriptMode: JavascriptMode.unrestricted,///JS执行模式
      onWebViewCreated: (WebViewController webViewController) {///在WebView创建完成后调用，只会被调用一次
        //
        //
        _controller.complete(webViewController);
      },
      javascriptChannels: <JavascriptChannel>[///JS和Flutter通信的Channel；
        _alertJavascriptChannel(context),
      ].toSet(),
      navigationDelegate: (NavigationRequest request) {//路由委托（可以通过在此处拦截url实现JS调用Flutter部分）；
        ///通过拦截url来实现js与flutter交互
        if (request.url.startsWith('js://webview')) {
          Fluttertoast.showToast(msg:'JS调用了Flutter By navigationDelegate');
          print('blocking navigation to $request}');
          return NavigationDecision.prevent;///阻止路由替换，不能跳转，因为这是js交互给我们发送的消息
        }

        return NavigationDecision.navigate;///允许路由替换
      },
      onPageFinished: (String url) {///页面加载完成回调
        // setState(() {
        //   _loading = false;
        // });
        print('Page finished loading: $url');
      },

    );
  }

  ///js与flutter交互
  JavascriptChannel _alertJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'invoke',//invoke要和网页协商一致
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);

        });
  }

  ///组合脚本执行方法，将数据发送给js端（flutter与js交互）
  void _onExecJavascript(String url) async {
    _controller.future.then((controller) {
      controller.loadUrl(url);
    });
    //或者 evaluateJavascript('callJS("js方法")')
  }

}





class Widget_WebView_Page extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Widget_WebView_State();
  }

}

class Widget_WebView_State extends State<Widget_WebView_Page>
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
    flutterWebviewPlugin.onStateChanged.listen((
        WebViewStateChanged webViewState) async {
//      setState(() {
//        title = webViewState.type.toString();
//      });
      switch (webViewState.type) {
        case WebViewState.finishLoad:
          handleJs();

          getWebTitle();

          break;
        case WebViewState.shouldStart:
          break;
        case WebViewState.startLoad:
          break;
        case WebViewState.abortLoad:
          break;
      }
    });

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

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/Class/ExpansionPageBeanEntity.dart';
import 'package:flutter_practice/Tool/Request.dart';

import 'AppbarSearch.dart';

class ExpansionTileList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ExpansionTileListState();
  }
}


class _ExpansionTileListState extends State<ExpansionTileList> {

  ExpansionPageBeanEntity expansionPageBeanEntity;
  List<Animes> listData = [];

  var _ipAddress = 'Unknown';

  var mTextFieldController;

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        result = data['origin'];
        print('请求 $data');
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
            print('请求 $result');
      }
    } catch (exception) {
      result = 'Failed getting IP address';
      print('请求 $result');
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }

  // void getHttp() async {
    // try {
    //   Response response = await Dio().get();
    //   Map a = json.decode(response.toString());
    //   expansionPageBeanEntity = ExpansionPageBeanEntity.fromJson(a);
    //   print(expansionPageBeanEntity.animes.first.animeTitle);
    // } catch (e) {
    //   print(e);
    // }
  // }
  @override
  void initState() {
    _getIPAddress();
    HttpUtils.getHttp(
      url: 'https://api.acplay.net/api/v2/search/episodes?anime=%E5%A6%96%E7%B2%BE%E7%9A%84%E5%B0%BE%E5%B7%B4',
      onCallBack: (value) {
        Map a = json.decode(value);
        expansionPageBeanEntity = ExpansionPageBeanEntity.fromJson(a);
        print(expansionPageBeanEntity.animes.first.animeTitle);

        // 刷新页面
        setState(() {
          print('刷新');
        });
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '2333',
      theme: new ThemeData(primaryColor: Colors.red),
      home: new Scaffold(
        appBar: new SearchAppBarWidget(
              focusNode: FocusNode(),
              controller: mTextFieldController,
              elevation: 2.0,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
              ],
              onEditingComplete: () => _checkInput()),
        // body: ListView.builder(
        //   itemBuilder: (BuildContext content, int index) => EntryItem(data[index]),
        //   itemCount: data.length,
        // ),
        body: childWidget(),
        // body: ListView.builder(
        //   itemBuilder: (BuildContext content, int index) => _setTiles(expansionPageBeanEntity.animes[index]),
        //   itemCount: expansionPageBeanEntity.animes.length
        // ),
        floatingActionButton: FloatingActionButton(
          child: Text('Back'),
          onPressed: () {
            Navigator.pop(context, 'Toast');
        }),
      ),
    );
  }

  void _checkInput() {
    HttpUtils.getHttp(
      url: 'https://api.acplay.net/api/v2/search/episodes?anime=' + mTextFieldController.text,
      onCallBack: (value) {
        Map a = json.decode(value);
        expansionPageBeanEntity = ExpansionPageBeanEntity.fromJson(a);
        print(expansionPageBeanEntity.animes.first.animeTitle);
        // 刷新页面
        setState(() {
          print('刷新');
        });
      }
    );
  }

  Widget childWidget() {
  Widget childWidget;
  if (expansionPageBeanEntity != null && expansionPageBeanEntity.animes.length != 0) {
    childWidget = new Padding(
      padding: EdgeInsets.all(6.0),
      child: new ListView.builder(
        itemCount: expansionPageBeanEntity.animes.length,
        itemBuilder: (context, item) => _setTiles(expansionPageBeanEntity.animes[item]),
      ),
    );
  } else {
    childWidget = new Stack(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
          child: new Center(
            child: new Text('正在加载中，莫着急哦~'),
          ),
        ),
      ],
    );
  }
  return childWidget;
}

  Widget _setTiles(Animes root) {
    if (root.episodes.isEmpty) return ListTile(title: Text(root.animeTitle));
    return ExpansionTile(
      key: PageStorageKey<Animes>(root),
      title: Text(root.animeTitle),
      children: root.episodes.map(_setSubTiles).toList(),
    );
  }

  var isSelect = false;
  Widget _setSubTiles(Episodes subRoot) {
    return ListTile(title: Text(subRoot.episodeTitle),
    // key: Key('value'),
    onTap: (){
      print('点击了' + subRoot.episodeTitle);
      setState(() {
        isSelect = !isSelect;
        print('是否选择===$isSelect');
      });
    },
    selected: isSelect,);
    // return ExpansionTile(
    //   key: PageStorageKey<Animes>(subRoot),
    //   title: Text(subRoot.animeTitle),
    //   children: subRoot.episodes.map(_setTiles).toList(),
    // );
  }
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildTiles(entry);
  }
}

class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry>children;
}

// Data to display
const List<Entry> data = <Entry>[
  Entry(
    'AAA',
    <Entry>[
      Entry('AAA-a',
      <Entry>[
        Entry('AAA-a-0'),
        Entry('AAA-a-1'),
        Entry('AAA-a-2'),
      ]
      ),
      Entry('AAA-b',
      <Entry>[
        Entry('AAA-b-0'),
        Entry('AAA-b-1'),
      ]
      ),
      Entry('AAA-c'),
    ]
  ),
    Entry(
    'BBB',
    <Entry>[
      Entry('BBB-a',
      <Entry>[
        Entry('BBB-a-0'),
        Entry('BBB-a-2'),
      ]
      ),
      Entry('BBB-b',
      <Entry>[
        Entry('BBB-b-0'),
        Entry('BBB-b-1'),
      ]
      ),
      Entry('BBB-c'),
    ]
  ),
];


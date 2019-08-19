import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_practice/Class/ExpansionPageBeanEntity.dart';
import 'package:flutter_practice/Tool/Request.dart';

class ExpansionTileList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ExpansionTileListState();
  }
}


class _ExpansionTileListState extends State<ExpansionTileList> {

  ExpansionPageBeanEntity expansionPageBeanEntity;

  var _ipAddress = 'Unknown';

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
        appBar: new AppBar(title: new Text('List'),),
        body: ListView.builder(
          itemBuilder: (BuildContext content, int index) => EntryItem(data[index]),
          itemCount: data.length,
        ),
        // body: ListView.builder(
        //   itemBuilder: (BuildContext content, int index) => EntryItem(data[index]),
        //   itemCount: expansionPageBeanEntity.animes.length,
        // ),
        floatingActionButton: FloatingActionButton(
          child: Text('Back'),
          onPressed: () {
            Navigator.pop(context, 'Toast');
        }),
      ),
    );
  }

  // Widget _buildTiles(Animes root) {
  //   if (root.children.isEmpty) return ListTile(title: Text(root.title));
  //   return ExpansionTile(
  //     key: PageStorageKey<Entry>(root),
  //     title: Text(root.title),
  //     children: root.children.map(_buildTiles).toList(),
  //   );
  // }
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



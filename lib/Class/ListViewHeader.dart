import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'BannerShow.dart';

typedef HeaderWidgetBuild = Widget Function(BuildContext context, int position);

typedef ItemWidgetBuild = Widget Function(BuildContext context, int position);

class ListViewHeaderPage extends StatefulWidget {

  List headerList;
  List listData;
  ItemWidgetBuild itemWidgetCreator;
  HeaderWidgetBuild headerCreator;

  ListViewHeaderPage(List this.listData,
      {Key key,
      List this.headerList,
      ItemWidgetBuild this.itemWidgetCreator,
      HeaderWidgetBuild this.headerCreator})
      : super(key: key);

  @override
  _ListViewHeaderState createState() {
    // TODO: implement createState
    return new _ListViewHeaderState();
  }
}

class _ListViewHeaderState extends State<ListViewHeaderPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: new ListView.builder(
          itemBuilder: (BuildContext context, int position) {
            return buildItemWidget(context, position);
          },
          itemCount: _getListCount()),
    );
  }

  int _getListCount() {
    int itemCount = widget.listData.length;
    return getHeaderCount() + itemCount;
  }

  int getHeaderCount() {
    int headerCount = widget.headerList != null ? widget.headerList.length : 0;
    return headerCount;
  }

  Widget _headerItemWidget(BuildContext context, int index) {
    if (widget.headerCreator != null) {
      return widget.headerCreator(context, index);
    } else {
      return new GestureDetector(
        child: new Padding(
            padding: new EdgeInsets.all(10.0),
            child: new Text("Header Row $index")),
        onTap: () {
          print('header click $index --------------------');
        },
      );
    }
  }

  Widget buildItemWidget(BuildContext context, int index) {
    if (index < getHeaderCount()) {
      return _headerItemWidget(context, index);
    } else {
      print('$index  ===  ${getHeaderCount()}');
      int pos = index - getHeaderCount();
      return _itemBuildWidget(context, pos);
    }
  }

  Widget _itemBuildWidget(BuildContext context, int index) {
    if (widget.itemWidgetCreator != null) {
      return widget.itemWidgetCreator(context, index);
    } else {
      return new GestureDetector(
        child: new Padding(
            padding: new EdgeInsets.all(10.0), child: new Text("Row $index")),
        onTap: () {
          print('click $index --------------------');
        },
      );
    }
  }
}








// TODO: test headerView
class NewsListPage extends StatefulWidget {
  @override
  NewsListPageState createState() {
    return NewsListPageState();
  }
}

class NewsListPageState extends State<NewsListPage> {
  List<BannerItem> bannerList = [];

  List<NewsItem> newsList = [];

  @override
  void initState() {
    super.initState();
    _getBannerData();
    _testNewsData();
    _getNewsListData();
  }

  _testNewsData() {
    for (int i = 0; i < 10; i++) {
      NewsItem news = new NewsItem();
      news.nid = i;
      news.nodeTitle =
          "$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i";
      news.node_created = 12345;
      news.total_count = '1111';
      news.node_type = 'news';
      news.thumbPath =
          '''http://img.mukewang.com/user/584ff8bf0001609c01000100-100-100.jpg''';
      news.news_category = 'test';

      newsList.add(news);
    }
  }

  _getNewsListData() async {
    Future.delayed(const Duration(seconds:1), () {
          List<NewsItem> tempList = [];
          for (var i = 0; i < 99; i++) {
            NewsItem news = new NewsItem();
            news.nid = int.parse('nid');
            news.nodeTitle = 'ASDFGHJK+++$i';
            news.node_created = int.parse('node_created');
            news.total_count = 'totalcount';
            news.node_type = 'node_type';
            news.thumbPath = 'field_news_video_thumb_app';
            news.news_category = 'field_news_category.toString()';
            print(news.news_category);
            tempList.add(news);
          }
          setState(() {
            newsList = tempList;
          });
    });
  }

  _getBannerData() async {
    Future.delayed(const Duration(seconds:1), () {
        List<BannerItem> temp = [];
      temp.add(BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/64/w1024h640/20181024/wBkr-hmuuiyw6863395.jpg''',
        '''近日，北大全校教师干部大会刚刚召开，63岁的林建华卸任北大校长；原北大党委书记郝平接替林建华，成为新校长。曾在北京任职多年、去年担任山西高院院长的邱水平回到北大，担任党委书记。图为2018年5月4日，北京大学举行建校120周年纪念大会，时任北京大学校长林建华（右）与时任北京大学党委书记郝平（左）'''));

      temp.add(BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/64/w1024h640/20181024/wBkr-hmuuiyw6863395.jpg''',
        '''近日，北大全校教师干部大会刚刚召开，63岁的林建华卸任北大校长；原北大党委书记郝平接替林建华，成为新校长。曾在北京任职多年、去年担任山西高院院长的邱水平回到北大，担任党委书记。图为2018年5月4日，北京大学举行建校120周年纪念大会，时任北京大学校长林建华（右）与时任北京大学党委书记郝平（左）'''));

      temp.add(BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/64/w1024h640/20181024/wBkr-hmuuiyw6863395.jpg''',
        '''近日，北大全校教师干部大会刚刚召开，63岁的林建华卸任北大校长；原北大党委书记郝平接替林建华，成为新校长。曾在北京任职多年、去年担任山西高院院长的邱水平回到北大，担任党委书记。图为2018年5月4日，北京大学举行建校120周年纪念大会，时任北京大学校长林建华（右）与时任北京大学党委书记郝平（左）'''));

      bannerList = temp;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('news list and banner'),
      ),
      body: new ListViewHeaderPage(
        newsList,
        headerList: [1, 2],
        itemWidgetCreator: getItemWidget,
        headerCreator: (BuildContext context, int position) {
          if(position == 0) {
            print('position==0');
            return new BannerWidget(180.0, bannerList);
          } else {
            print('position!=0');
            return new Padding(padding: EdgeInsets.all(10.0), child: 
              Text('$position -----header------- '),);
          }
        },
      ),
    );
  }

  _onItemClick(int pos) {
    if (newsList != null && newsList.length > pos) {
      print('click $pos ==== ${newsList[pos].nid}');
    }
  }

  Widget getItemWidget(BuildContext context, int pos) {
    print('2993939');
    return new GestureDetector(
      onTap: () {
        _onItemClick(pos);
      },
      child: IntrinsicHeight(
        child: Container(
          height: 80.0,
          padding: EdgeInsets.all(7.0),
          decoration: UnderlineTabIndicator(
              borderSide: BorderSide(color: Color(0Xfff1f1f1), width: 1.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 118 / 66,
                child: FadeInImage.memoryNetwork(
                  placeholder: Uint8List('''http://img.mukewang.com/user/584ff8bf0001609c01000100-100-100.jpg'''.length),
                  image: newsList[pos].thumbPath,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 7.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        newsList[pos].nodeTitle,
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                        ),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                      Container(child: getItemBottomWidget(pos)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getItemBottomWidget(int pos) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
              child: Text(
            newsList[pos].news_category,
            style: TextStyle(
                color: Color(0xff979797),
                fontSize: 12.0,
                decoration: TextDecoration.none),
          )),
          Container(
            padding: EdgeInsets.all(3.0),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xfff1f1f1)),
                    borderRadius: BorderRadius.circular(3.0)),
                color: Color(0xfff1f1f1)),
            child: Text(
              '${newsList[pos].total_count}浏览',
              style: TextStyle(
                  color: Color(0xff979797),
                  fontSize: 12.0,
                  decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsItem {
  int nid;
  String nodeTitle;
  String total_count;
  int node_created;
  String node_type;
  String thumbPath;
  String news_category;
}

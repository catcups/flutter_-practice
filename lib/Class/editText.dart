import 'dart:ui';
import 'package:flutter/material.dart';

                                // V界特
void main()=>runApp(new EditTextWidget());

class EditTextWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeFramentState();
  }
}

class _HomeFramentState extends State<EditTextWidget> {
  bool isVisible=false;

  var editableTextController = TextEditingController();

  var mTextFieldController;

  var tffController;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var editableTextController = TextEditingController();
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
            body: ListView(
              children: <Widget>[
                // TODO : 基本的输入框
                Container(
                  // color: Colors.cyanAccent,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  alignment: Alignment.center,
                  height: 40,
                  width: 200,
                  child: EditableText(
                    controller: editableTextController, 
                    focusNode:FocusNode(), 
                    style: TextStyle(color: Colors.red), 
                    cursorColor: Colors.blue,
                    backgroundCursorColor: Colors.yellow,
                    textInputAction: TextInputAction.done,
                    cursorWidth: 10.0,
                    cursorRadius: Radius.circular(5.0),
                    onChanged: (result){
                      print('object=$result===' + editableTextController.text);
                    },
                    onEditingComplete: (){
                      print('object==onEditingComplete');
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    onSelectionChanged: (textSelection, selectionChangedCause){
                      print('onSelectionChanged==$textSelection, $selectionChangedCause');
                    },
                    onSelectionHandleTapped: (){
                      print('object==onSelectionHandleTapped');
                    },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.cyanAccent,
                      border: Border.all(width: 2.0, color: Colors.blue),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                ),
                // TODO: TextField
                Container(
                  width: 200.0,
                  height: 40.0,
                  margin: EdgeInsets.all(15.0),
                  child: TextField(
                    controller: mTextFieldController,
                    focusNode: FocusNode(),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.perm_identity,
                        color:Colors.redAccent
                      ),
                      labelText: 'please edit',
                      labelStyle: TextStyle(color: Colors.blue),
                      helperText: 'yabai',
                      suffixIcon: Icon(Icons.add),
                      prefixIcon: Icon(Icons.pregnant_woman),
                      // border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 40,
                  child: TextFormField(
                    controller: tffController,
                    focusNode: FocusNode(),
                    decoration: InputDecoration(
                      icon: Icon(Icons.add)
                    ),
                  ),
                )
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
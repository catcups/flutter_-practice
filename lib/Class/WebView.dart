import 'package:flutter/material.dart';

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
            children: _buildCenterWidget()
          ),
        ),
      ),
    );
  }

  // 输入框加按钮
  List <Widget> _buildCenterWidget() {
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
            }
            if (_textEditingController.text != '') {
              print(_textEditingController.text);
            }
          },
        ),
    ];
  }

}
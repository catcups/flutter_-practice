import 'package:flutter/material.dart';


class MyAppF extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return MaterialApp(
     
      title:'Beam Utils Home',
       home: new loginPage2()
      // home: new homePage()
    );

  }
}



class loginPage2 extends StatefulWidget {
@override
  State createState(){
    return new loginPageState2();
  }
 
}

class loginPageState2 extends State<loginPage2>{
 @override
  
     Widget build(BuildContext context) {
       final Color backgroundColor1 = Color(0xFF444152);
       final Color backgroundColor2 = Color(0xFF6f6c7d);
       final Color highlightColor = Color(0xfff65aa3);
       final Color foregroundColor = Colors.white;

  return  Scaffold(
    body:  new login_body().GetLoginContainer(context),
   );
     
     
     }

    

     
  

}

class login_body{

       final Color backgroundColor1 = Color(0xFF444152);
       final Color backgroundColor2 = Color(0xFF6f6c7d);
       final Color highlightColor = Color(0xfff65aa3);
       final Color foregroundColor = Colors.white;


Container GetLoginContainer(BuildContext context){
       
       return Container(
         //定义body背景颜色 灰色 渐变
    decoration: new BoxDecoration(
       gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: new Alignment(1.0, 0.0), // 10% of the width, so there are ten blinds.
         // begin: Alignment.topLeft,
         // end: new Alignment(9.0, 0.0),
          colors: [backgroundColor1, backgroundColor2], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),

      height: MediaQuery.of(context).size.height,
      //定义元素
      child:Column(
        children: <Widget>[
          //定义logo 和 logo下面的描述
          new logo_container().GetLoginLogo(),
        //账号输入框
         new login_box().GetAccountContainer(context),
        //密码输入框
         new login_box().GetPasswordContainer(context),
         //登录按钮
          new login_box().GetLoginButton(context),
         
        //  new Container(
        //    padding: EdgeInsets.only(left: 20.0),
        //    //width: 100.0,
        //    alignment: Alignment.topLeft,
        //    child: Text(
        //      'Password',
        //        style: TextStyle(color: foregroundColor,fontSize: 16.0),
        //    ),
        //  )



        ],

      )
      
    );
     

 }

}

class login_box{
       final Color backgroundColor1 = Color(0xFF444152);
       final Color backgroundColor2 = Color(0xFF6f6c7d);
       final Color highlightColor = Color(0xfff65aa3);
       final Color foregroundColor = Colors.white;

      //获取账号输入框Container
       Container GetAccountContainer(BuildContext context){
         return getBox(context,'',Icons.account_box);
       }
       //获取密码输入框Container
       Container GetPasswordContainer(BuildContext context){
         return getBox(context,'',Icons.lock_open);
       }
      //获取登录按钮Container
       Container GetLoginButton(BuildContext context){
         return new Container(
            width: MediaQuery.of(context).size.width,
            //定义按钮的外边距
            margin: const EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
            //内容位置
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  //一个OutLineButton 实现登录的按钮样式
                  child: new OutlineButton(
                    //按钮的外形
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                        //按钮按下后渐变的颜色
                    color: Colors.blueGrey,
                    highlightedBorderColor: Colors.white,
                    //当点击按钮的时候触发事件，跳转到新的页面
                    onPressed: (){
                           Navigator.push(
                                        context,
                                       new MaterialPageRoute(builder: (context) => new homePage()),
                                        );
                                  },
                                  //按钮内部的内容
                    child: new Container(
                      //按钮内边距定义
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "LOGIN IN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
       }
       

        Container getBox(BuildContext context,String hidentString,IconData icon){

        return new Container(

                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: this.foregroundColor,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
                        child: Icon(
                          //Icons.alternate_email,
                          icon,
                          color: this.foregroundColor,
                        ),
                      ),
                      new Expanded(
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: hidentString,
                            hintStyle: TextStyle(color: this.foregroundColor),
                          ),
                        ),
                      ),
                    ],
                  ),


              );

      }





}


class logo_container{

       final Color backgroundColor1 = Color(0xFF444152);
       final Color backgroundColor2 = Color(0xFF6f6c7d);
       final Color highlightColor = Color(0xfff65aa3);
       final Color foregroundColor = Colors.white;

       Container GetLoginLogo(){

          return new Container(
            //定义内边距中的顶部和底部
              padding: const EdgeInsets.only(top: 80.0, bottom: 50.0),
              //开始通过一个cloum来定义两个Contrainer，分别为logo以及logo下面的描述
              //将图标居中
              child:Center(
                child: new Column(
                  
                  children: <Widget>[
                    // 分别定义两个Contrainer来定义界面的图标
                    // 定义圆形图标
                    new Container(
                     
                      height: 128.0,
                      width: 128.0,
                      child: CircleAvatar(
                        
                        backgroundColor: Colors.transparent,
                        foregroundColor: foregroundColor,
                        radius: 100.0,
                        child: new Text(
                          'B',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.w100
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: foregroundColor,
                          width: 1.0
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  


                    
                    new Padding(
                      padding: const  EdgeInsets.all(16.0),
                      child: Text(
                        'welcome to Beam Utils Home',
                        style: TextStyle(
                          color: foregroundColor
                        ),
                      ),
                    )

                  ],

                ),
              ),


          );
          

       }





}


class homePage extends  StatefulWidget{
@override
  State createState(){
    return new homePageState();
  }
}


class homePageState extends State<homePage>{
 @override
  
     Widget build(BuildContext context) {
       final Color backgroundColor1 = Color(0xFF444152);
       final Color backgroundColor2 = Color(0xFF6f6c7d);
       final Color highlightColor = Color(0xfff65aa3);
       final Color foregroundColor = Colors.white;

  return  Scaffold(
    body:  new Container(
      //设置背景颜色
       decoration: new BoxDecoration(
       gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: new Alignment(1.0, 0.0), // 10% of the width, so there are ten blinds.
         // begin: Alignment.topLeft,
         // end: new Alignment(9.0, 0.0),
          colors: [backgroundColor1, backgroundColor2], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
    ),
   );
     }
}





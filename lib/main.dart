import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'chapter3/Text.dart';
import 'chapter3/ChapterThree.dart';
import 'chapter5/ScaffoldStudy.dart';
import 'chapter6/ScrollStudy.dart';
import 'chapter7/Funtions.dart';
import 'chapter7/DataShare.dart';
import 'chapter7/YibuUI.dart';
import 'chapter9/AnimationStudy.dart';
import 'chapter9/HeroAnim.dart';
void main(){
  runApp(MyApp());
}

/*自定义组件*/
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text('flutter hello'),
      ),
      body: HomeWidget(),
    ),theme: ThemeData(primarySwatch: Colors.blue),
    routes: {
      "routerCommon":(context)=>Router(),
      //路由适配
      'awr':(context)=>TipRouter(text: ModalRoute.of(context).settings.arguments),
      'nameEch':(context)=>EchoRoute()
    },);
  }

}

class HomeContent extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FlatButton(
          child: Text("携带参数跳转，并接收返回值"),
          textColor: Colors.blue,
          onPressed: () async  {
            //导航到新路由 返回值是一个 future用于接收 返回值
           var result = await Navigator.push( context,
                MaterialPageRoute(builder: (context) {
                  return TipRouter(text:'我是传递的参数啊');
                }));
           print("路由返回--》"+result);
          },
        ),
        Text('我在学flutter',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40.0,
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        RaisedButton(onPressed:() {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Router();
          }));
        },
        child: Text('普通页面跳转'),),
        RaisedButton(onPressed: (){
          Navigator.pushNamed(context, 'routerCommon');
        },
        child: Text('通过路由名称打开router'),),
        RaisedButton(onPressed: ()async{
         var reesult = await Navigator.pushNamed(context, 'awr',arguments: '666啊');
         print('通过路由名称打开 返回值--->'+reesult);
        },
          child: Text('通过路由名称打开携带参数路由'),),
        RaisedButton(onPressed: ()async{
          var reesult = await Navigator.pushNamed(context, 'nameEch',arguments: "我是传递的arguments");
          print('通过路由名称打开 返回值--->'+reesult);
        },
          child: Text('命名路由传递arguments'),),
        Image.asset('imgs/dart.png'),
        RaisedButton.icon( onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context){
          return UseTextWidget();
          }));
          }, icon: Icon(Icons.info), label: Text('Text3.3'),textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        splashColor: Colors.blueGrey,
        highlightColor: Colors.greenAccent,
        color: Colors.blueAccent)
      ],
    );

  }
}


class HomeWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Column(
          children: <Widget>[
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return UseImageWidget();
              }));
            },
              child: Text('Image'),),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return UseProgressWiget();
              }));
            },
              child: Text('进度指示器'),),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ScaffoldRoute();
              }));
            },
              child: Text('Scaffold学习'),),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MYScrollActivity(type: 7,);
              }));
            },
              child: Text('ScrollView'),),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return CustomScrollViewRoute();
              }));
            },
              child: Text('CustomScrollView'),),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ScrollContrlTestRoute();
              }));
            },
              child: Text('ScrollController'),),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return TestWill();
              }));
            },
              child: Text('防止误点击'),),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return TestShareRoute();
              }));
            },
              child: Text('数据共享'),),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return TestFutureBuilder();
              }));
            },
              child: Text('Future异步更新'),),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return StreamTestRoute();
              }));
            },
              child: Text('Stream异步更新'),),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return AnimationStudyRoute();
              }));
            },
              child: Text('动画'),),
            RaisedButton(onPressed: (){
              Navigator.push(context, PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 1000),
                pageBuilder: (BuildContext context,Animation animation,Animation secondeAnimation){
                  return new FadeTransition(opacity: animation,
                  child: AnimationStudyRoute(),);
                }
              ));
            },
            child: Text('自定义路由动画'),),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return HeroAnimationRouteA();
                }
              ));
            },
            child: Text('hero动画'),),
            HeroAnimationRouteA()
          ],
        ),
      ),
    );
  }

}
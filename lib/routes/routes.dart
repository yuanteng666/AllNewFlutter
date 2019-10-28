import 'package:flutter/material.dart';

class Router extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('第一个路由'),
    ),
    body: Center(child: Text('this is newRouter'),
    ));
  }
}


class TipRouter extends StatelessWidget {
    String text;
  TipRouter({Key key,@required  this.text}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('路由传值'),),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              // 设置返回给上级页面的返回值
              RaisedButton(onPressed: ()=>Navigator.pop(context,"我是返回值"),
              child: Text('返回'),)
            ],
          ),
        ),
      ),
    );
  }

}


class EchoRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //获取命名路由 传递过来的参数
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(body: Center(child: Text(args),),
    appBar: AppBar(title: Text('接收arguments'),),);
  }

}
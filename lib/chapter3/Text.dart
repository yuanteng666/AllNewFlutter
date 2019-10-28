import 'package:flutter/material.dart';

class UseTextWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(appBar: AppBar(title: Text('text'),),
    body: Center(child: Column(
      children: <Widget>[
        Text('hello world'*6,textAlign: TextAlign.center,
        style: TextStyle(fontSize: 32.00,color: Colors.blueAccent,
        background: new Paint()..color = Colors.yellow,
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.dotted,
        height: 1.2),),
        Text('this is text'*8,maxLines: 1,overflow: TextOverflow.ellipsis,textScaleFactor: 1.5,),
        Text.rich(TextSpan(children: [
          TextSpan(text: '主页'),
          TextSpan(text: 'https://flutterchina.club',
          style: TextStyle(height: 2,color: Colors.cyanAccent,backgroundColor: Colors.amber))
        ])),
        DefaultTextStyle(style: TextStyle(color: Colors.red,fontSize: 36),
        child: Column(
          children: <Widget>[
            Text('hahhahhahahah'),
            Text('六六六啊，五魁首啊'),
            Text('八匹马啊',style: TextStyle(color: Colors.blueAccent),)
          ],
        ),)
      ],
    ),),);
  }

}
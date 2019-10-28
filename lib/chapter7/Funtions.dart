import 'package:flutter/material.dart';
class TestWill extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WillSate();
  }

}

class WillSate extends State<TestWill>{
  DateTime _lastTimeAt ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
      title: Text('willScope'),
    ),
    body: WillPopScope(
      child:  Container(
        alignment: Alignment.center,
        child: Text("1秒内连续按两次返回键退出"),
      ),
      onWillPop: () async {
        if(_lastTimeAt == null || DateTime.now().difference(_lastTimeAt) > Duration(seconds: 1)){
          _lastTimeAt = DateTime.now();
          return false;
        }
        return true;
    },
    ),
    );
  }

}
import 'package:flutter/material.dart';


class StateSharewidget extends InheritedWidget{
  final int data;
  StateSharewidget({this.data,@required Widget child}):super(child:child);


  /*
  * 该回调决定 当data 发生变化时候，是否通知子树中依赖data的组件
  * true 通知
  * false 不通知*/
  @override
  bool updateShouldNotify(StateSharewidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != this.data;
  }

  /*
  * 定义一个便捷方法用于让 子组件方便的获取 data值*/
  static StateSharewidget of(BuildContext context){
    return  context.inheritFromWidgetOfExactType(StateSharewidget);
  }

}

class TestShareDateWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestState();
  }

}

class TestState extends State<TestShareDateWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(StateSharewidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('data changed');
  }
}

class TestShareRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestShareState();
  }

}

class TestShareState extends State<TestShareRoute>{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('数据共享'),
      ),
      body: Center(
        child: StateSharewidget(data: count,
        child: Column(
          children: <Widget>[
            TestShareDateWidget(),
            RaisedButton(
              child: Text('点击'),
              onPressed: (){
                setState(() {
                  count++;
                });
              },
            )
          ],
        ),),
      ),

    );
  }

}
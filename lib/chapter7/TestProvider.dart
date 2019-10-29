import 'dart:collection';

import 'package:flutter/material.dart';

// 一个通用的InheritedWidget，保存任需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget{

  InheritedProvider({this.data,@required Widget child}):super(child :child);

  //共享状态使用泛型
  final T data;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify

    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }

}

// 该方法用于在Dart中获取模板类型
Type _typeOf<T>() => T;

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget{

  final Widget child;
  final T data;
  ChangeNotifierProvider({Key key,this.child,this.data});

  @override
  _ChangeNotifierProviderState<T> createState() {
    // TODO: implement createState
    return _ChangeNotifierProviderState<T>();
  }

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context){
    final type = _typeOf<InheritedProvider<T>>();
    final provider =  context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>;
    return provider.data;
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>>{

  void update(){
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    widget.data.addListener(update);
    super.initState();
  }
  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    // TODO: implement didUpdateWidget
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if(widget.data != oldWidget.data){
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);    }
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InheritedProvider<T>(data: widget.data,
    child: widget.child,);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.data.removeListener(update);

    super.dispose();
  }
}


class Item{
  final int count ;
  final double price;
  Item({this.count,this.price});
}

class CartModal extends ChangeNotifier{
  // 用于保存购物车中商品列表
  List<Item> _list = new List();
  
  //  禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items  {
   return new UnmodifiableListView(_list);
  }

  //总价
  double get totalPrice{
    return _list.fold(0, (value, item) => value + item.count * item.price);
  }

  //将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add(Item item){
    _list.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
}

class ProviderRote extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

}


class _ProviderRouteState  extends State<ProviderRote>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ChangeNotifierProvider(
        data: CartModal(),
        child: Builder(
          builder: (context){
            return Column(
              children: <Widget>[
                Builder(builder: (context){
                  var cart=ChangeNotifierProvider.of<CartModal>(context);
                  return Text("总价: ${cart.totalPrice}");
                }),
                Builder(builder: (context){
                  print("RaisedButton build"); //在后面优化部分会用到
                  return RaisedButton(
                    child: Text("添加商品"),
                    onPressed: () {
                      //给购物车中添加商品，添加后总价会更新
                      ChangeNotifierProvider.of<CartModal>(context).add(Item(count: 1,price: 20.0));
                    },
                  );
                }),
              ],
            );
          },
        ),
      ),
    );
  }

}
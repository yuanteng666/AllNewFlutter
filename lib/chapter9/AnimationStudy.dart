
import 'package:flutter/material.dart';


class AnimationStudyRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: Text('动画学习'),
        ),
        body: ScaleAnimationRoute1(),
    );
  }

}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() {
    // TODO: implement createState
    return _ScaleAnimationRouteState();
  }

}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin{

    Animation<double> animation ;
    AnimationController animationController;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(vsync: this,
    duration: Duration(seconds: 2));
    //图片从0 变化到300
    animation = new Tween(begin: 0.0,end: 300.0).animate(animationController)
    ..addListener((){
        setState(() {

        });
    });
    //启动动画
    animationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
        child: Image.asset('imgs/dart.png',
        width: animation.value,
        height: animation.value,),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
      //释放资源
      animationController.dispose();
    super.dispose();
  }
}


class AnimationedImg extends AnimatedWidget{

    AnimationedImg({Key key,Animation<double> animation}):super(key:key,
    listenable:animation);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      final Animation animation = listenable;
    return new Center(
        child: Image.asset('imgs/dart.png',width: animation.value,
        height: animation.value,),
    );
  }

}


class ScaleAnimationRoute1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScaleAnimationRoute1Route();
  }

}

class ScaleAnimationRoute1Route extends State<ScaleAnimationRoute1> with
SingleTickerProviderStateMixin{

    Animation<double> animation;
    AnimationController controller;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2),vsync: this);
    animation = new Tween(begin: 100.0,end: 400.0).animate(controller)
    ..addStatusListener((status){
        if(status == AnimationStatus.completed){

        }
        if(status == AnimationStatus.dismissed){

        }
        if(status == AnimationStatus.forward){

        }
        if(status == AnimationStatus.reverse){

        }

    });
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GrowTransition(animation: animation,
    child: Image.asset('imgs/dart.png'),);
  }

  @override
  void dispose() {
    // TODO: implement dispose
      controller.dispose();
    super.dispose();
  }
}

class GrowTransition  extends StatelessWidget{
   final Animation animation;
  final  Widget child;
    GrowTransition({this.child,this.animation});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
        child: new AnimatedBuilder(animation: animation,
            builder: (BuildContext context,Widget child){
                return new Container(
                    child: child,
                    width: animation.value,
                    height: animation.value,
                );
            },
             child: child,),
    );
  }

}
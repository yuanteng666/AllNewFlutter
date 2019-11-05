
import 'package:flutter/material.dart';

class AnimatedSwitcherCounterRoute extends StatefulWidget{

    const AnimatedSwitcherCounterRoute({Key key}) : super(key: key);
  @override
  AnimatedSwitchState createState() {
    // TODO: implement createState
    return AnimatedSwitchState();
  }

}

class AnimatedSwitchState extends State<AnimatedSwitcherCounterRoute> {
    int _count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Column(
            children: <Widget>[
                AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    transitionBuilder: (Widget child,Animation<double> animation){
                        return ScaleTransition(child: child,scale: animation,);
                    },
                    child: Text('$_count',
                        //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                        key: ValueKey<int>(_count),
                        style: Theme.of(context).textTheme.display1,),
                ),
                RaisedButton(
                    child: Text('+1'),
                    onPressed: (){
                        setState(() {
                            _count++;
                        });
                    },
                )
            ],
        ),
    );
  }


}

class MySlideTransition extends AnimatedWidget{
    final Widget child;
    final bool isFromHitTest;

    MySlideTransition({Key key,
        @required Animation<Offset> postion,
        this.child,
        this.isFromHitTest = true}):
        assert(postion != null),
            super(key :key,listenable:postion);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      Offset offset = position.value;
      //动画反向执行时，调整x偏移，实现“从左边滑出隐藏”
      if(position.status == AnimationStatus.reverse){
          offset = Offset(-offset.dx, offset.dy);
      }
    return FractionalTranslation(
        translation: offset,
        transformHitTests: isFromHitTest,
        child: child,
    );
  }

    Animation<Offset> get position => listenable;

}
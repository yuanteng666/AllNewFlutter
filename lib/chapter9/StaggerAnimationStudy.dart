
import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget{


    Animation<double> height;
    Animation<EdgeInsets> padding;
    Animation<Color> color;
   final  Animation<double> controller;
    StaggerAnimation({Key key,this.controller}):super(key:key){
        height = Tween(
            begin: 0.0,
            end: 300.0
        ).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
                0.0,0.6,curve: Curves.ease
            )
        ));

        color = ColorTween(
            begin: Colors.green,
            end: Colors.red
        ).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.0,0.6,curve: Curves.ease)
        ));

        padding = Tween<EdgeInsets>(
            begin: EdgeInsets.only(left: 0),
            end: EdgeInsets.only(left: 100.0)
        ).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
                0.6,1.0,curve: Curves.ease
            )
        ));
    }


    Widget _builderAnimation(BuildContext buildContext,Widget child){
        return Container(
            alignment: Alignment.bottomCenter,
            padding: padding.value,
            child: Container(
                color: color.value,
                height: height.value,
                width: 50.0,
            ),
        );
    }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return AnimatedBuilder(
        builder: _builderAnimation,
        animation: controller,
    );
  }

}


class StaggerRoute  extends StatefulWidget{
  @override
  StaggerRouteState createState() {
    // TODO: implement createState
    return StaggerRouteState();
  }

}

class StaggerRouteState extends State<StaggerRoute> with SingleTickerProviderStateMixin{

    AnimationController controller;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this
    );
  }

  Future<Null> _playAnimation () async{
        try{
            //先正向执行动画
            await controller.forward().orCancel;
            //再反向执行动画
            await controller.reverse().orCancel;
        }on TickerCanceled{

        }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
            _playAnimation();
        },
        child: Center(
            child: Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 1.0
                    )
                ),
                child: StaggerAnimation(controller: controller,),
            ),
        ),
    );
  }

}
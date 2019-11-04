import 'package:flutter/material.dart';

class HeroAnimationRouteA extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        alignment: Alignment.topCenter,
        child: InkWell(
            child: ClipOval(
                child: Hero(
                    tag: 'avatar',
                    child: Image.asset('imgs/dart.png'),
                ),
            ),
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Scaffold(
                        appBar: AppBar(
                            title: Text('hero'),
                        ),
                        body: HeroAnimationRoteB(),
                    );
                }));
            },
        ),
    );
  }

}



class HeroAnimationRoteB extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Hero(
            tag: 'avatar',
            child: Image.asset('imgs/dart.png'),
        ),
    );
  }

}
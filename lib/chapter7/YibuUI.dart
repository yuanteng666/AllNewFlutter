

import 'package:flutter/material.dart';

class TestFutureBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: getdata(),
        builder:(BuildContext context,AsyncSnapshot snaphsot){
            if(snaphsot.connectionState == ConnectionState.done){
                if(snaphsot.hasError){

                    return Text('数据fail');

                }else{
                    return Text('${snaphsot.data}');
                }
            }else{
                //xianshi loading
                return Text('${snaphsot.data}');

            }
        },
    );
  }

}

Future<String> getdata() async{
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
}


class StreamTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<int>(
        stream: counter(),
        builder: (BuildContext context,AsyncSnapshot<int> shot){
            if(shot.hasError){
                return Text('snap error ${shot.error}');
            }
            switch(shot.connectionState){
                case ConnectionState.none:
                    return Text('没有stream');
                case ConnectionState.done:
                   return Text('完成');
                case ConnectionState.waiting:
                    return Text('等待状态');
                case ConnectionState.active:
                    return Text('active ${shot.data}');
            }
            return null;
        },
    );
  }

}

Stream<int> counter(){
    return  Stream.periodic(Duration(seconds: 1),(i){
        return i;
    });
}
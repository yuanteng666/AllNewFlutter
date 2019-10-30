

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
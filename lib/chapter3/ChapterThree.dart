import 'package:flutter/material.dart';

class UseImageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: Text('Image & icon'),),
      body: new Center(
        child: new Column(
          children: <Widget>[
            Image(image: AssetImage('imgs/flutter.jpg'),
            height: 100.0,),
            Image.asset('imgs/flutter.jpg',height: 50.0,),
            Image.network('https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',width: 100,),
            Image(image: NetworkImage('https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',),height: 60.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.edit_location,color: Colors.blue,),
                Icon(Icons.equalizer,color: Colors.yellow,),
                Icon(Icons.error,color: Colors.red,),
              ],
            ),
            SwichBoxAndCheckBoxWidget(),
            Column(
              children: <Widget>[
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: '用户名',
                    hintText: '邮箱',
                    fillColor: Colors.red,
                    prefixIcon: Icon(Icons.person)
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请输入密码',
                    prefixIcon: Icon(Icons.lock)
                  ),
                  obscureText: true,
                  onChanged: (value){
                    print(value);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}

class SwichBoxAndCheckBoxWidget extends StatefulWidget{
  @override
  BoxState createState() {
    // TODO: implement createState
    return new BoxState();
  }

}

class BoxState extends State<SwichBoxAndCheckBoxWidget>{
  bool isActive = false;
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(children: <Widget>[
      Switch(value: isActive,
      onChanged: (value){
        setState(() {
          isActive = value;
        });
      },
      activeColor: Colors.red,),
      Checkbox(
        value: isSelect,
        onChanged: (value){
          setState(() {
            isSelect = value;
          });
        },
      )

    ],);
  }

}



class InputAndFormWidget extends StatefulWidget{
  @override
  _InputState createState() {
    // TODO: implement createState
    return _InputState();
  }

}


class _InputState extends State<InputAndFormWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Column(
        children: <Widget>[

        ],
      ),
      appBar: AppBar(title: Text('输入框和表单'),)
    );
  }

}


class UseProgressWiget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: Column(
          children: <Widget>[
              LinearProgressIndicator(value: 0.8,
              valueColor: AlwaysStoppedAnimation(Colors.red),
              backgroundColor: Colors.blueGrey,),
              LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                backgroundColor: Colors.blueGrey,
              ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
              backgroundColor: Colors.blueGrey,
              strokeWidth: 10,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.red),
              value: 0.6,
              backgroundColor: Colors.brown,
              strokeWidth: 6,
            ),
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                backgroundColor: Colors.blueGrey,
              ),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
                value: 0.6,
                backgroundColor: Colors.brown,
                strokeWidth: 6,
              ),
            ),
            SizedBox(
              height: 100,
              width: 60,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
                value: 0.6,
                backgroundColor: Colors.brown,
                strokeWidth: 6,
              ),
            )
          ],
        ),
        appBar: AppBar(title: Text('进度指示器'),)
    );;
  }

}
class MyIcons {
  static const IconData natofication = IconData(0xe642, fontFamily: 'myIcon', matchTextDirection: true);
  static const IconData upload = IconData(0xe640, fontFamily: 'myIcon', matchTextDirection: true);
  static const IconData setting = IconData(0xe63d, fontFamily: 'myIcon', matchTextDirection: true);
  static const IconData link = IconData(0xe63e, fontFamily: 'myIcon', matchTextDirection: true);

}
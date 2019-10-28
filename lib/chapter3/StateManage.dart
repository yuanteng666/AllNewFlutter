import 'package:flutter/material.dart';


/*
* 自己管理自己的状态*/
class TabBoxA extends StatefulWidget{
@override
_TabBoxAState createState() => new _TabBoxAState();

}

class _TabBoxAState extends State<TabBoxA>{
bool _active = false;
@override
Widget build(BuildContext context) {
// TODO: implement build
return new GestureDetector(child: Container(
child: Center(
child: Text(_active ? 'active':'no active',
style: TextStyle(fontSize: 25.0,color: Colors.blue),),
),
width: 200.0,
height: 200.0,
decoration: BoxDecoration(
color: _active ? Colors.lightGreen[700] : Colors.grey[600]
),
),
onTap: _handleTap,
);
}

void _handleTap(){
setState(() {
_active = !_active;
});
}
}

/*
* 父组件管理子组件的状态*/
class ParentWeiget extends StatefulWidget{
@override
ParentWeigetState createState() {
// TODO: implement createState
return new ParentWeigetState();
}

}

class ParentWeigetState extends State<ParentWeiget>{
bool  _active = false;

void _handleTabBoxChanged(bool newValue){
setState(() {
_active = newValue;
});
}

@override
Widget build(BuildContext context) {
// TODO: implement build
return Container(child: TabBoxB(onChangeed: _handleTabBoxChanged,active: _active,),);
}

}

class TabBoxB extends StatelessWidget{
final bool active;
final ValueChanged<bool> onChangeed;

TabBoxB({Key key,this.active :false,@required this.onChangeed}):super(key:key);

void _handleTap(){
onChangeed(!active);
}

@override
Widget build(BuildContext context) {
// TODO: implement build
return  new GestureDetector(
onTap: _handleTap,
child: new Container(
child: new Center(
child: new Text(
active ? 'Active' : 'Inactive',
style: new TextStyle(fontSize: 32.0, color: Colors.white),
),
),
width: 200.0,
height: 200.0,
decoration: new BoxDecoration(
color: active ? Colors.lightGreen[700] : Colors.grey[600],
),
),
);
}
}

/*
* 混合状态管理*/
class TabBoxC extends StatefulWidget{
final bool isActive;
final ValueChanged<bool> onChanged;

TabBoxC({Key key,this.isActive:false,@required this.onChanged}):super(key: key);


@override
_TabBoxCState createState() {
// TODO: implement createState
return _TabBoxCState();
}

}

class _TabBoxCState extends State<TabBoxC>{
bool _highlight = false;

void _handleTapDown(TapDownDetails details){
setState(() {
_highlight = true;
});
}


void _handleTapUp(TapUpDetails details){
setState(() {
_highlight = false;
});
}

void _handleTapCancel(){
setState(() {
_highlight = false;
});
}


void _handleTap(){
widget.onChanged(!widget.isActive);
}
@override
Widget build(BuildContext context) {
// TODO: implement build
return new GestureDetector(
onTap: _handleTap,
onTapDown: _handleTapDown,
onTapUp: _handleTapUp,
onTapCancel: _handleTapCancel,
child: new Container(
child: Center(
child: Text(widget.isActive ? "active":"no active",
style: TextStyle(fontSize: 32.0,color: Colors.blue),),
),
width: 200.0,
height: 200.0,
decoration: BoxDecoration(
color: widget.isActive ? Colors.lightGreen[700] : Colors.grey[600],
border: _highlight ? Border.all(color: Colors.teal[700],
width: 10.0,):null,
),
),
);
}

}


class ParentWidgetC extends StatefulWidget{
@override
_ParentWidgetCState createState() {
// TODO: implement createState
return _ParentWidgetCState();
}

}

class _ParentWidgetCState extends State<ParentWidgetC>{

bool active = false;
_handleTabBoxChanged(bool newVal){
setState(() {
active = newVal;
});
}
@override
Widget build(BuildContext context) {
// TODO: implement build
return Container(
child: TabBoxC(onChanged: _handleTabBoxChanged,isActive: active,)
);
}

}
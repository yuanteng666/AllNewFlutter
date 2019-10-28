import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
class MYScrollActivity extends StatelessWidget{
  final int type  ;
  Widget divider1 = Divider(color: Colors.red,height: 3.0,);
  Widget divider2 = Divider(color: Colors.yellow,height: 3.0,);


  MYScrollActivity({Key key,this.type :0}):super(key :key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget widget = null;
    switch(this.type){
      case 0:
        widget = SingleScrolView();
      break;
      //不使用sliver的listview
      case 1:
        {
          widget = ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              Text('hallow world'),
              Text('hallow world'),
              Text('hallow world'),
              Text('hallow world'),
              Text('hallow world'),
              Text('hallow world'),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(5),
                  gradient: LinearGradient(colors: [Colors.red,Colors.yellow,Colors.blue]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5
                    )
                  ]
                ),
                child:  Text('hallow world'),
              )
            ],
          );
        }
        break;
      //使用sliver 的lsitview;
      case 2:{
      widget =  ListView.builder(itemBuilder: (BuildContext context,int index){
            return ListTile(title: Text("$index"),subtitle: Text("i love $index"),);
        },
        itemCount: 100,
          //强制高度为50
        itemExtent: 50.0,);
      }
      break;
      //带有分割线的listview
      case 3:{
      widget =  ListView.separated(itemBuilder: (BuildContext context,int index){
          return ListTile(title: Text("$index"),subtitle: Text("i love $index"),);

        }, separatorBuilder: (BuildContext context,int index){
          return index % 2 == 0?divider1:divider2;
        }, itemCount: 100);
      }
      break;
      case 4 :{
        widget = InfinityListView();
      }
      break;
      case 5:{
        widget = WithHeaderlistView();
      }
      break;
      case 6:{
        widget = GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,

          ),
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  style: BorderStyle.solid,
                  width: 3
                )
              ),
              child: Icon(Icons.account_balance),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blue,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Icon(Icons.account_balance),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blue,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Icon(Icons.account_balance),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blue,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Icon(Icons.account_balance),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blue,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Icon(Icons.account_balance),
            )
          ],
        );
      }
      break;
      case 7:{
        widget = GridView.count(crossAxisCount: 3,
        childAspectRatio: 1,
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast),
        ],);
      }
      break;
        

    }
    return Scaffold(
      appBar: AppBar(
        title: Text('可滚动组件'),
      ),
      body: widget,
    );
  }

}

class SingleScrolView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String str = "QWERTYUIOPLKJHGFDSAZXCVBNM";
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: str.split("").map((e)=>Text(e,style: TextStyle(fontSize: 32),)).toList(),
          ),
        ),
      ),
    );
  }

}



class InfinityListView extends StatefulWidget{
  @override
  _InfinityState createState() {
    // TODO: implement createState
    return _InfinityState();
  }

}

class _InfinityState extends State<InfinityListView>{

  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestData();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ListView.separated(
        itemBuilder: (BuildContext context,int index){
          //如果是最后一个元素
          if(_words[index] == loadingTag){
            //如果不够一百个数据，重新请求，并显示loading
            if(_words.length - 1 < 100){
              //请求数据
              _requestData();
              //显示loading
              return Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 28.0,
                  height: 28.0,
                  child: CircularProgressIndicator(strokeWidth: 3,),
                ),
              );
            }else{
              return Container(
                alignment: Alignment.center,
                child: Text('没有更多数据了',style: TextStyle(color: Colors.blue),),
                padding: EdgeInsets.all(16),
              );
            }
          }
          return ListTile(title: Text(_words[index]),subtitle: Text("i love $index"),);
        },
        separatorBuilder: (BuildContext context,int index){
          return Divider(color: Colors.red,);
        },
        itemCount: _words.length);
  }

  _requestData(){
    Future.delayed(Duration(seconds: 2)).then((e){
      //添加二十个数据
      _words.insertAll(_words.length-1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      //重新构建列表
      setState(() {

      });
    });
  }

}


class WithHeaderlistView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ListTile(title: Text('我是头部'),),
        Expanded(
          child: ListView.builder(itemBuilder: (BuildContext context,int index){
            return ListTile(title: Text('我是 $index'),);
          },
            itemCount: 20,
            itemExtent: 50,),
        )
      ],
    );
  }

}


class CustomScrollViewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('demo'),
              background: Image.asset('imgs/dart.png'),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5
              ),
              delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: new Text('grid item $index'),
                );
              },childCount: 20),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate((BuildContext context,int index){
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            },
            childCount: 50),
          )
        ],
      ),
    );
  }


}

class ScrollContrlTestRoute extends StatefulWidget{
  @override
  ScrollContrlTestState createState() {
    // TODO: implement createState
    return ScrollContrlTestState();
  }

}


class ScrollContrlTestState extends State<ScrollContrlTestRoute>{

  ScrollController _controller = new ScrollController();
  bool isShowBtn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener((){
      if(_controller.offset < 1000 && isShowBtn){
        setState(() {
          isShowBtn = false;
        });
      }
      if(_controller.offset > 1000 && !isShowBtn){
        setState(() {
          isShowBtn = true;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollContrller'),
      ),
      body: ListView.builder(itemBuilder: (BuildContext context,int index){
        return ListTile(title: Text("$index"),);
      },
      itemExtent: 50,
      itemCount: 50,
      controller: _controller,),
      floatingActionButton: !isShowBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          _controller.animateTo(0, duration: Duration(milliseconds: 200), curve:Curves.ease );
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

}
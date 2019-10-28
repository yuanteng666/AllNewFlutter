import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ScaffoldRoute extends StatefulWidget{
  @override
  _ScaffoldState createState() {
    // TODO: implement createState
    return new _ScaffoldState();
  }

}

class _ScaffoldState extends State<ScaffoldRoute> with SingleTickerProviderStateMixin {
  int _selectIndex = 0;
  List tabs = ["新闻", "历史", "图片"];
  TabController _tabController ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length,vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('我爱flutter'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share),onPressed: (){},)
        ],
        //自定义图标
        leading: Builder(
          builder: (context){
            return IconButton(
              icon: Icon(Icons.dashboard,color: Colors.white,),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e)=>Tab(text: e,)).toList(),
        ),
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e){
          return Container(
            alignment: Alignment.center,
          child: Text(e),
        );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('home')),
          BottomNavigationBarItem(icon: Icon(Icons.business),title: Text('bussiness')),
          BottomNavigationBarItem(icon: Icon(Icons.school),title: Text('school'))
        ],
        currentIndex: _selectIndex,
        fixedColor: Colors.blueAccent,
        onTap: _onBottomBarTap,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onActionBtnTap,
      ),
    );
  }

  void _onBottomBarTap(int index){
    setState(() {
      _selectIndex = index;
    });
  }

  void _onActionBtnTap(){

  }
}


class MyDrawer extends StatelessWidget{
  const MyDrawer({Key key}):super(key : key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: MediaQuery.removePadding(context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: ClipOval(
                        child: Image.asset('imgs/index.jpg',width: 80,height: 80,),
                      ),
                    ),
                    Text('院腾',style: TextStyle(color: Colors.blueAccent,fontSize: 30.0,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(title: const Text('添加账户'),leading:const Icon(Icons.account_circle),),
                    ListTile(title: const Text('删除账户'),leading:const Icon(Icons.remove_circle),),

                  ],
                ),
              )
            ],
          )),
    );
  }


}
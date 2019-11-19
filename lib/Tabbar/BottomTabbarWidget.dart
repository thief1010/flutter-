import 'package:flutter/material.dart';
import 'package:ios_develop/LayoutTest/FlexLayoutPage.dart';
import 'package:ios_develop/LayoutTest/RowOrColumnLayoutPage.dart';
import 'package:ios_develop/LayoutTest/StackLayoutPage.dart';
import 'package:ios_develop/LayoutTest/WrapLayoutPage.dart';
import 'package:ios_develop/ContainerTest/TabbarPage.dart';
import 'package:ios_develop/AlertView/AlertViewPage.dart';
import 'package:ios_develop/Gesture/GesturePage.dart';

class BottomTabbarWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '标签栏',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomTabbarWidget(),
    );
  }
}

class BottomTabbarWidget extends StatefulWidget {
  BottomTabbarWidget({Key  key,this.title})  : super(key  : key);
  final String title;
  @override
  _BottomTabbarWidgetState createState() => _BottomTabbarWidgetState();
}

class _BottomTabbarWidgetState extends State<BottomTabbarWidget> {
  int  _currentIndex = 0;
  List<Widget> pages = [GesturePage(),WrapLayoutPage(),AlertViewPage(),TabbarPage()];



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar:
//      BottomAppBar(
//        color: Colors.white,
//        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
//        child: Row(
//          children: [
//            IconButton(icon: Icon(Icons.home)),
//            SizedBox(), //中间位置空出
//            IconButton(icon: Icon(Icons.business)),
//          ],
//          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
//        ),
//      ),

      BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('平台'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('商城'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.functions),
            title: Text('功能'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('个人中心'),
          ),
        ],
        currentIndex: _currentIndex,
//        fixedColor: Colors.redAccent,
//        unselectedItemColor: Colors.redAccent,
//        backgroundColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      ///IndexedStack是为了保存页面切换之后的状态
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
    );

  }
}
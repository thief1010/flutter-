import 'package:flutter/material.dart';

class GesturePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '触摸事件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GestureHomePage(title: '触摸事件'),
    );
  }
}

class GestureHomePage extends StatefulWidget {
  GestureHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GesturePageState createState() => new _GesturePageState();
}

class _GesturePageState extends State<GestureHomePage>
    with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  double _width = 200.0;

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
//      Center(//缩放图片
//        child: GestureDetector(
//          //指定宽度，高度自适应
//          child: Image.asset("Assets/logoImage/logo.png", width: _width),
//          onScaleUpdate: (ScaleUpdateDetails details) {
//            setState(() {
//              //缩放倍数在0.8到10倍之间
//              _width=200*details.scale.clamp(.8, 10.0);
//            });
//          },
//        ),
//      ),
      Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
//              //垂直方向拖动事件
//              onVerticalDragUpdate: (DragUpdateDetails details) {
//                setState(() {
//                  _top += details.delta.dy;
//                });
//              },
//              //水平方向拖动事件
//              onHorizontalDragUpdate: (DragUpdateDetails details) {
//                setState(() {
//                  _left += details.delta.dx;
//                });
//              },
              //任意拖动事件
              //手指按下时会触发此回调
              onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${e.globalPosition}");
              },
              //手指滑动时会触发此回调
              onPanUpdate: (DragUpdateDetails e) {
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                //打印滑动结束时在x、y轴上的速度
                print(e.velocity);
              },
            ),
          ),
        ],
      ),
    );
  }
}

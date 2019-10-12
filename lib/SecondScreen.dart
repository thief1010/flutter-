import 'package:flutter/material.dart';
import 'package:ios_develop/ButtonStatus.dart';


class SecondScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SecondScreenPage(),
    );
  }
}



class SecondScreenPage extends StatefulWidget {
//  BuildContext pageContext;
//
//  SecondScreenPage(this.pageContext);


  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreenPage> with TickerProviderStateMixin {
  ButtonStatus btn1 = ButtonStatus.NORMAL;
  ButtonStatus btn2 = ButtonStatus.NORMAL;
  ButtonStatus btn3 = ButtonStatus.NORMAL;
  ButtonStatus btn4 = ButtonStatus.NORMAL;
  ButtonStatus btn5 = ButtonStatus.NORMAL;

  AnimationController controller1; // 该对象管理着animation对象
  Animation animation1; //该对象是当前动画的状态，例如动画是否开始，停止，前进，后退。
  AnimationController controller2;
  Animation animation2;
  AnimationController controller3;
  Animation animation3;
  AnimationController controller4;
  Animation animation4;
  AnimationController controller5;
  Animation animation5;

  // 初始化
  @override
  void initState() {
    super.initState();
    // vsync 是为了防止动画的UI不在当前屏幕时，不需要绘制，从而防止消耗不必要的资源。
    controller1 = AnimationController(
        duration: Duration(milliseconds: 2000), reverseDuration: Duration(seconds: 2), vsync: this);


//    // 开始播放动画，只显示动画一次
//    controller1.forward();
//    // 循环播放动画
//    controller1.repeat();
//    //停止动画
//    controller1.stop();
//    //重置动画
//    controller1.reset();
//    //反向播放动画(在正向动画播放完的情况下才有效)
//    controller1.reverse();
//    //释放动画所占的资源
//    controller1.dispose();

    animation1 = ColorTween(begin: Colors.redAccent, end: Colors.cyan)
        .animate(controller1)
    // 添加监听器。..addListener()，这种语法意味着使用animate()的返回值来调用addListener()方法
      ..addListener(() {
        // 当动画值发生变化时调用setState
        setState(() {
//          print('我在渐变颜色');
        });
      });
//      ..addStatusListener((status) {
//      if (status == AnimationStatus.completed) {
//        controller1.reverse();
//      } else if (status == AnimationStatus.dismissed) {
//        controller1.forward();
//      }
//    });

    controller2 = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);

    animation2 = Tween(begin: 100.0, end: 150.0).animate(controller2)
    ..addListener(() {
      setState(() {});
    });
//    animation2.addStatusListener((status) {
//      if(status == AnimationStatus.completed){
//        //动画结束后，让动画反向执行
//        controller1.reverse();
//
//      }else if (status == AnimationStatus.dismissed){
//
//        controller1.forward();
//      }
//
//    });

    controller3 = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    // curve 曲线是定义动画的动作,也就说动画是非线性运动
    CurvedAnimation curve3 = CurvedAnimation(
        parent: controller3, curve: Curves.elasticOut);
    animation3 = Tween(begin: 100.0, end: 150.0).animate(curve3);
    animation3.addListener(() {
        setState(() {});
    });
//    animation3.addStatusListener((status){
//      if(status == AnimationStatus.completed){
//        //动画结束后，让动画反向执行
//        controller3.reverse();
//
//      }else if (status == AnimationStatus.dismissed){
//
//        controller3.forward();
//      }
//    });

    controller4 = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    animation4 = CurvedAnimation(
        parent: controller4, curve: Curves.easeIn);
//    animation4.addListener(() {
//      setState(() {});
//    });
//    animation4.addStatusListener((status){
//      if(status == AnimationStatus.completed){
//        //动画结束后，让动画反向执行
//        controller4.reverse();
//
//      }else if (status == AnimationStatus.dismissed){
//
//        controller4.forward();
//      }
//    });



    controller5 = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    animation5 = CurvedAnimation(
        parent: controller5, curve: Curves.easeIn);
//    animation5.addListener(() {
//      setState(() {});
//    });
//    animation5.addStatusListener((status){
//      if(status == AnimationStatus.completed){
//        //动画结束后，让动画反向执行
//        controller5.reverse();
//
//      }else if (status == AnimationStatus.dismissed){
//
//        controller5.forward();
//      }
//    });
  }

  @override
  dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0)  ,
        child : ListView(
          children: <Widget>[
            createFirstContainer(),
            createSecondContainer(),
            createThirdContainer(),
            createFourthContainer(),
            createFifthContainer(),
          ],
        )
      ),
    );
  }

  Widget createFirstContainer(){
    return Container(
      padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container (
            color: animation1.value,
            width: 100.0,
            height: 100.0,
          ),
          Padding(padding: EdgeInsets.all(20)),
          RaisedButton(
            child: Text('渐变颜色'),
            color: Colors.cyan,
            onPressed: () {
//              controller1.forward();
              if (btn1 == ButtonStatus.NORMAL) {
                setState(() => btn1 = ButtonStatus.LOADING);
                controller1.forward();
              }else {
                setState(() => btn1 = ButtonStatus.NORMAL);
                controller1.reverse();
              }
            },
          )
        ],
      ),
    );
  }

  Widget createSecondContainer(){
    return Container(
      padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container (
            color: Colors.blue,
            width: animation2.value,
            height: animation2.value,
          ),
          Padding(padding: EdgeInsets.all(20)),
          RaisedButton(
            child: Text('线性渐变大小'),
            color: Colors.blue,
            onPressed: () {
//              controller2.forward();
              if (btn2 == ButtonStatus.NORMAL) {
                setState(() => btn2 = ButtonStatus.LOADING);
                controller2.forward();
              }else {
                setState(() => btn2 = ButtonStatus.NORMAL);
                controller2.reverse();
              }
            },

          )
        ],
      ),
    );
  }

  Widget createThirdContainer(){
    return Container(
      padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container (
            color: Colors.deepOrange,
            width: animation3.value,
            height: animation3.value,
          ),
          Padding(padding: EdgeInsets.all(20)),
          RaisedButton(
            child: Text('非线性渐变大小'),
            color: Colors.deepOrange,
            onPressed: () {
//              controller3.forward();
              if (btn3 == ButtonStatus.NORMAL) {
                setState(() => btn3 = ButtonStatus.LOADING);
                controller3.forward();
              }else {
                setState(() => btn3 = ButtonStatus.NORMAL);
                controller3.reverse();
              }
            },

          )
        ],
      ),
    );
  }

  Widget createFourthContainer(){
    return Container(
      padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FadeTransition(
            opacity: animation4,
            child: FlutterLogo(
              size: 100.0,
            ),
          ),
          Padding(padding: EdgeInsets.all(20)),
          RaisedButton(
            child: Text('渐变透明度'),
            color: Colors.green,
            onPressed: () {
//              controller4.forward();
              if (btn4 == ButtonStatus.NORMAL) {
                setState(() => btn4 = ButtonStatus.LOADING);
                controller4.forward();
              }else {
                setState(() => btn4 = ButtonStatus.NORMAL);
                controller4.reverse();
              }
            },
          )
        ],
      ),
    );
  }

  Widget createFifthContainer(){
    return Container(
      padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RotationTransition(
            turns: animation5,
            child: FlutterLogo(
              size: 100.0,
            ),
          ),
          Padding(padding: EdgeInsets.all(20)),
          RaisedButton(
            child: Text('旋转'),
            color: Colors.tealAccent,
            onPressed: () {
//              controller5.forward();
              if (btn5 == ButtonStatus.NORMAL) {
                setState(() => btn5 = ButtonStatus.LOADING);
                controller5.forward();
              }else {
                setState(() => btn5 = ButtonStatus.NORMAL);
                controller5.reverse();
              }
            },
          )
        ],
      ),
    );
  }
}
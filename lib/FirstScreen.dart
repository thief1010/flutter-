import 'package:flutter/material.dart';
import 'package:ios_develop/SecondScreen.dart';

class FirstScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreenPage(title: 'First Demo'),
    );
  }
}

class FirstScreenPage extends StatefulWidget {
  FirstScreenPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

//with是dart的关键字，意思是混入的意思，就是说可以将一个或者多个类的功能添加到自己的类无需继承这些类，避免多重继承导致的问题。
class _FirstScreenState extends State<FirstScreenPage>
    with TickerProviderStateMixin {
  AnimationController controller; // 该对象管理着animation对象
  Animation curve; //该对象是当前动画的状态，例如动画是否开始，停止，前进，后退。
  AnimationController controller1; // 该对象管理着animation对象
  Animation curve1;

  // 初始化
  @override
  void initState() {
    super.initState();
    // vsync 在此处时忽略不必要的情况
    controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    // curve 曲线是定义动画的动作,也就说动画是非线性运动
    curve1 = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    curve = ColorTween(begin: Colors.redAccent, end: Colors.blue)
        .animate(controller)
    // 添加监听器。..addListener()，这种语法意味着使用animate()的返回值来调用addListener()方法
    ..addListener(() {
      // 当动画值发生变化时调用setState
      setState(() {
        print('我在渐变颜色');
      });
    });

    curve1.addListener(() {
      // 当动画值发生变化时调用setState
      setState(() {
        print('我在动');
      });
    });
    curve.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        //动画结束后，让动画反向执行
        controller.reverse();

      }else if (status == AnimationStatus.dismissed){

        controller.forward();
      }

    });

//    只显示动画一次，根据调用setState的打印情况就会知道。重载就会使其激活，自己的见解，需思量
    controller.forward();
//    重复不断的效果，调用setState的打印效果显示
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: curve.value),
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 200.0,
            width: 200.0,
          ),
          Padding(padding: EdgeInsets.all(20)),
          new Container(
            color: curve.value,
            height: 50.0,
            width: curve1.value * 200, // animation.value的值是0到1，*100是具体的大小
          ),

//          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
//          new Container(
//            color: curve.value,
//            height: 50.0,
//            width: 100,
//          ),
//          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
//          new Container(
//            color: curve.value,
//            height: 50.0,
//            width: 50,
//          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ),
    );
//      body: Center(
//        child: FadeTransition(
//          opacity: curve,
//          child: FlutterLogo(
//            size: 100.0,
//          ),
//        ),
//      ),

//    );
  }

  @override
  dispose() {
    super.dispose();
    controller.dispose();
  }
}

import 'package:flutter/material.dart';

class ConteinerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '容器类组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContainerHomePage(title: '容器类组件'),
    );
  }
}

class ContainerHomePage extends StatefulWidget {
  ContainerHomePage({Key  key, this.title})  : super(key  : key);
  final String title;

  @override
  _ContainerPageState createState() => new _ContainerPageState();
}

class _ContainerPageState extends State<ContainerHomePage> with AutomaticKeepAliveClientMixin{
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      //上下左右各添加16像素补白
      padding: EdgeInsets.all(10.0),
      child: Column(
        //显式指定对齐方式为左对齐，排除对齐干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            //左边添加8像素补白
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Hello world"),
          ),
          Padding(
            //上下各添加8像素补白
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("I am Jack"),
          ),
          Padding(
            // 分别指定四个方向的补白
            padding: const EdgeInsets.fromLTRB(30.0,.0,20.0,20.0),
            child: Text("Your friend"),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: double.infinity, //宽度尽可能大
                minHeight: 50.0 //最小高度为50像素
            ),
            child: Container(
                height: 5.0,
                child: redBox
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child :
//              SizedBox(
//                  width: 80.0,
//                  height: 80.0,
//                  child: redBox
//              ),
//                ConstrainedBox(
//                  constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0),
//                  child: redBox,
//                ),
            ConstrainedBox(//有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的
              constraints : BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,maxWidth: 80.0),
              child :redBox,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                  borderRadius: BorderRadius.circular(3.0), //3像素圆角
                  boxShadow: [ //阴影
                    BoxShadow(
                        color:Colors.black54,
                        offset: Offset(2.0,2.0),
                        blurRadius: 4.0
                    )
                  ]
              ),
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                child: Text("Login", style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget redBox=DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);
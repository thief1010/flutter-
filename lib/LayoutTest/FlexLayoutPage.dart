import 'package:flutter/material.dart';
import 'package:ios_develop/LayoutTest/WrapLayoutPage.dart';

class FlexLayoutPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '弹性布局',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlexLayoutHomePage(title: '弹性布局'),
    );
  }
}

class FlexLayoutHomePage extends StatefulWidget {
  FlexLayoutHomePage({Key  key, this.title})  : super(key  : key);
  final String title;

  @override
  _FlexLayoutState createState() => new _FlexLayoutState();
}

class _FlexLayoutState extends State<FlexLayoutHomePage> {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      ///弹性布局允许子组件按照一定比例来分配父容器空间。
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  ///Spacer的功能是占用指定比例的空间，实际上它只是Expanded的一个包装类
//                  Spacer(
//                    flex: 1,
//                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.cyan,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  color: Colors.yellow,
                  textColor: Colors.black,
                  child: Text('流式布局'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => WrapLayoutPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],

      ),
    );
  }
}
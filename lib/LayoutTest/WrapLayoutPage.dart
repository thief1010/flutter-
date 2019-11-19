import 'package:flutter/material.dart';
import 'package:ios_develop/LayoutTest/StackLayoutPage.dart';
import 'package:flutter/gestures.dart';

class WrapLayoutPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '流式布局',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WrapLayoutHomePage(title: '流式布局'),
    );
  }
}

class WrapLayoutHomePage extends StatefulWidget {
  WrapLayoutHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WrapLayoutPageState createState() => new _WrapLayoutPageState();
}

class _WrapLayoutPageState extends State<WrapLayoutHomePage> {
  PointerEvent _event;
  String _operation = "No Gesture detected!";
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Wrap(
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 4.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.start, //沿主轴方向居中
            children: <Widget>[
              new Chip(
                avatar: new CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('A')),
                label: new Text('Hamilton'),
              ),
              new Chip(
                avatar: new CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('M')),
                label: new Text('Lafayette'),
              ),
              new Chip(
                avatar: new CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('H')),
                label: new Text('Mulligan'),
              ),
              new Chip(
                avatar: new CircleAvatar(
                    backgroundColor: Colors.blue, child: Text('J')),
                label: new Text('Laurens'),
              ),
            ],
          ),
//          Padding(
//            padding: EdgeInsets.only(top: 30),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                MaterialButton(
//                  color: Colors.yellow,
//                  textColor: Colors.black,
//                  child: Text('层叠布局'),
//                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      new MaterialPageRoute(
//                          builder: (context) => StackLayoutPage()),
//                    );
//                  },
//                ),
//              ],
//            ),
//          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Listener(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 300.0,
                height: 100.0,
                child: Text(_event?.toString() ?? "",
                    style: TextStyle(color: Colors.white)),
              ),
              onPointerDown: (PointerDownEvent event) =>
                  setState(() => _event = event),
              onPointerMove: (PointerMoveEvent event) =>
                  setState(() => _event = event),
              onPointerUp: (PointerUpEvent event) =>
                  setState(() => _event = event),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 200.0,
                height: 100.0,
                child: Text(
                  _operation,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () => updateText("Tap"), //点击
              onDoubleTap: () => updateText("DoubleTap"), //双击
              onLongPress: () => updateText("LongPress"), //长按
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "你好世界"),
                  TextSpan(
                    text: "点我变色",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: _toggle ? Colors.blue : Colors.red,
                    ),
                    recognizer: _tapGestureRecognizer
                      ..onTap = () {
                        setState(() {
                          _toggle = !_toggle;
                        });
                      },

                  ),
                  TextSpan(text: "你好世界"),
                ],
              ),
            ),
          ),
          Icon(
            Icons.chevron_left,
            size: 40,
          ),
        ],
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}

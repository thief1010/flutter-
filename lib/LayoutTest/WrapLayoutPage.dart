import 'package:flutter/material.dart';
import 'package:ios_develop/LayoutTest/StackLayoutPage.dart';

class WrapLayoutPage extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp (
      title: '流式布局',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WrapLayoutHomePage(title: '流式布局'),
    );
  }
}

class WrapLayoutHomePage extends  StatefulWidget {
  WrapLayoutHomePage({Key  key, this.title})  : super(key  : key);
  final String title;

  @override
  _WrapLayoutPageState createState() => new _WrapLayoutPageState();
}

class _WrapLayoutPageState extends State<WrapLayoutHomePage> {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column (
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Wrap(
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 4.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.start, //沿主轴方向居中
            children: <Widget>[
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: new Text('Hamilton'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
                label: new Text('Lafayette'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
                label: new Text('Mulligan'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                label: new Text('Laurens'),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  color: Colors.yellow,
                  textColor: Colors.black,
                  child: Text('层叠布局'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => StackLayoutPage()),
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

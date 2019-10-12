import 'package:flutter/material.dart';

class StackLayoutPage extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp (
      title: '层叠布局',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StackLayoutHomePage(title: '层叠布局'),
    );
  }
}

class StackLayoutHomePage extends  StatefulWidget {
  StackLayoutHomePage({Key  key, this.title})  : super(key  : key);
  final String title;

  @override
  _StackLayoutPageState createState() => new _StackLayoutPageState();
}

class _StackLayoutPageState extends State<StackLayoutHomePage> {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ConstrainedBox(//通过ConstrainedBox来确保Stack占满屏幕
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment:Alignment.center ,
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: <Widget>[
            Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}

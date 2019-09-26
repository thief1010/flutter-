import 'package:flutter/material.dart';
import 'package:ios_develop/ButtonStatus.dart';
import 'package:ios_develop/main.dart';
import 'package:ios_develop/TestSecondVC.dart';

class TestOneViewController extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestOneViewControllerPage(title: 'TestOne'),
    );
  }
}



class TestOneViewControllerPage extends StatefulWidget {
  TestOneViewControllerPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _TestOneViewControllerState createState() => _TestOneViewControllerState();
}

class _TestOneViewControllerState extends State<TestOneViewControllerPage> {

  String nameStr;

  ButtonStatus btnStatus;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          newTextField(),
          LoginButton(),
        ],
      ),
    );
  }

  TextField newTextField() {
    return TextField(
      maxLength: 20,

      keyboardType: TextInputType.text,

      textAlign: TextAlign.center,

      decoration: InputDecoration(
        icon: Icon(Icons.text_fields),
        labelText: "请输入你的姓名",
        contentPadding: EdgeInsets.all(20.0),

      ),
      onChanged: (_inputText) {
        nameStr = _inputText;
        if(nameStr.length % 2 == 0) {
          setState(() => btnStatus = ButtonStatus.LOADING);
        }else {
          setState(() => btnStatus = ButtonStatus.NORMAL);
        }
        print(_inputText);
      },

      autofocus: true,

    );
  }
  
  Widget LoginButton() {

    Widget resWidget;

    switch(btnStatus){
      case ButtonStatus.LOADING:
        resWidget = MaterialButton(
          color: Colors.yellow,
          textColor: Colors.black,
          child: Text('确定'),
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => TestSecondVC()),
            );
          },
        );
        break;
      default:
        resWidget = MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('取消'),
          onPressed: () {
          },
        );
    }
    return resWidget;


  }
}




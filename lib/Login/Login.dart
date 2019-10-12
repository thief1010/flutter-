import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '登录',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(context),
    );
  }
}



class LoginPage extends StatefulWidget {
  BuildContext logContent;
  LoginPage(this.logContent);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //手机号字符串
  String phoneStr;
  //验证码字符串
  String codeStr;

  // 焦点节点: 验证码
  FocusNode captchaTextFieldNode = FocusNode();

  // 焦点节点: 手机号
  FocusNode phoneTextFieldNode = FocusNode();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          createLogoView(),
          createPhoneTextfield(),
          createCodeView(),
        ],
      ),
    );
  }
  Container createLogoView(){
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
      child: Column(
        children: <Widget>[
          Image.asset(
            'Assets/logoImage/logo.png',
            width: 150,
            height: 150,
          ),
          Text("益合众Boss"),
        ],
      ),
    );
  }
  Container createPhoneTextfield(){
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextField(
        maxLength: 11,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(10.0),
            labelText: "手机号",
            prefixIcon: Icon(Icons.phone)
        ),
        // 输入框发生变更, 更新变量值
        onChanged: (text) {
          phoneStr = text;
        },
        // 页面自动聚焦
        autofocus: true,
        // 输入完成后跳转焦点
        onEditingComplete: () =>
            FocusScope.of(context).requestFocus(captchaTextFieldNode),
      ),
    );
  }
  /// 验证码区
  Container createCodeView() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _captchaTextField()
              ],
            ),
          ),

          /// 设置边距
          Padding(
            /// 与四个方向的距离:
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: _sendCaptchaButton(),
          )
        ],
      ),
    );
  }

  /// 验证码输入框
  TextField _captchaTextField() {
    return TextField(
      // 指定聚焦节点
      focusNode: captchaTextFieldNode,
      maxLength: 5,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(10.0),
        prefixIcon: Icon(Icons.sms),
        labelText: '验证码',
      ),

      onChanged: (text) {
        codeStr = text;
      },
      // 页面自动聚焦
      autofocus: true,
      // 输入完成后跳转焦点
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(phoneTextFieldNode),
    );
  }

  /// 发送验证码按钮
  Widget _sendCaptchaButton() {
    return OutlineButton(
      child: Text('发送'),
      onPressed: () {
//        sendCaptcha();
      },
    );
  }
}

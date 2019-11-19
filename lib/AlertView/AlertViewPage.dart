import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ios_develop/LocalLauguage/ChineseCupertinoLocalizations.dart';

class AlertViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        ChineseCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlertViewHomePage(),
    );
  }
}

class AlertViewHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AlertViewPageState();
  }
}

class _AlertViewPageState extends State<AlertViewHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('提示框'),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text("自定义提示框1"),
            onPressed: () async {
              //弹出对话框并等待其关闭
              bool delete = await showDeleteConfirmDialog1(context);
              if (delete == null) {
                print("取消删除");
              } else {
                print("已确认删除");
                //... 删除文件
              }
            },
          ),
          RaisedButton(
            child: Text("提示框2"),
            onPressed: () async {
              //弹出对话框并等待其关闭
              await changeLanguage(context);
            },
          ),
          RaisedButton(
            child: Text("提示框3"),
            onPressed: () async {
              //弹出对话框并等待其关闭
              await showListDialog(context);
            },
          ),
          RaisedButton(
            child: Text("提示框4（复选框可点击）"),
            onPressed: () async {
              //弹出删除确认对话框，等待用户确认
              bool deleteTree = await showDeleteConfirmDialog3(context);
              if (deleteTree == null) {
                print("取消删除");
              } else {
                print("同时删除子目录: $deleteTree");
              }
            },
          ),
          RaisedButton(
            child: Text("提示框5(显示底部菜单列表)"),
            onPressed: () async {
              int type = await _showModalBottomSheet(context);
              print(type);
            },
          ),
          RaisedButton(
            child: Text("提示框5(底部弹出全屏菜单列表)"),
            onPressed: () async {
              _showBottomSheet(context);
            },
          ),
          RaisedButton(
            child: Text("提示框6(弹出loading框)"),
            onPressed: () async {
              await showLoadingDialog(context);
            },
          ),
          RaisedButton(
            child: Text("提示框7(弹出日历选择框1)"),
            onPressed: () async {
              await _showDatePicker1(context);
            },
          ),
          RaisedButton(
            child: Text("提示框8(弹出日历选择框2)"),
            onPressed: () async {
              await _showDatePicker2(context);
            },
          ),
          RaisedButton(
            child: Text("提示框9(弹出日历选择框3)"),
            onPressed: () async {
              await _showDatePicker3(context);
            },
          ),
        ],
      ),
    );
  }
}

// 弹出对话框
Future<bool> showDeleteConfirmDialog1(BuildContext context) {
  return showCustomDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("您确定要删除当前文件吗?"),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              // 执行删除操作
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
//    showDialog<bool>(
//    context: context,
//    builder: (context) {
//      return AlertDialog(
//        title: Text("提示"),
//        content: Text("您确定要删除当前文件吗?"),
//        actions: <Widget>[
//          FlatButton(
//            child: Text("取消"),
//            onPressed: () => Navigator.of(context).pop(), // 关闭对话框
//          ),
//          FlatButton(
//            child: Text("删除"),
//            onPressed: () {
//              //关闭对话框并返回true
//              Navigator.of(context).pop(true);
//            },
//          ),
//        ],
//      );
//    },
//  );
}

///弹出固定数量的选择性弹窗
Future<void> changeLanguage(BuildContext context) async {
  int i = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('请选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                // 返回1
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                // 返回2
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('美国英语'),
              ),
            ),
          ],
        );
      });

  if (i != null) {
    print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
  }
}

///定义一个List列表的弹窗
Future<void> showListDialog(BuildContext context) async {
  int index = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      var child = Column(
        children: <Widget>[
          ListTile(title: Text("请选择")),
          Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              )),
        ],
      );
      //使用AlertDialog会报错
      //return AlertDialog(content: child);
      return Dialog(child: child);
      ///用以下代码代替Dialog是一样的效果
//        UnconstrainedBox(
//        constrainedAxis: Axis.vertical,
//        child: ConstrainedBox(
//          constraints: BoxConstraints(maxWidth: 280),
//          child: Material(
//            child: child,
//            type: MaterialType.card,
//          ),
//        ),
//      );

    },
  );
  if (index != null) {
    print("点击了：$index");
  }
}

///自定义遮罩弹出框
Future<T> showCustomDialog<T>({
  BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(data: theme, child: pageChild)
              : pageChild;
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87, // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}


/// 单独封装一个内部管理选中状态的复选框组件
class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({
    Key key,
    this.value,
    this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  _DialogCheckboxState createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        //将选中状态通过事件的形式抛出
        widget.onChanged(v);
        setState(() {
          //更新自身选中状态
          value = v;
        });
      },
    );
  }
}

Future<bool> showDeleteConfirmDialog3(BuildContext context) {
  bool _withTree = false; //记录复选框是否选中
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("您确定要删除当前文件吗?"),
            Row(
              children: <Widget>[
                Text("同时删除子目录？"),
                DialogCheckbox(
                  value: _withTree, //默认不选中
                  onChanged: (bool value) {
                    //更新选中状态
                    _withTree = !_withTree;
                  },
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              // 将选中状态返回
              Navigator.of(context).pop(_withTree);
            },
          ),
        ],
      );
    },
  );
}

/// 弹出底部菜单列表模态对话框
Future<int> _showModalBottomSheet(BuildContext context) {
  return showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () => Navigator.of(context).pop(index),
          );
        },
      );
    },
  );
}


/// 返回的是一个controller,showBottomSheet是调用widget树顶部的Scaffold组件的ScaffoldState的showBottomSheet同名方法实现，也就是说要调用showBottomSheet方法就必须得保证父级组件中有Scaffold。
PersistentBottomSheetController<int> _showBottomSheet(BuildContext context) {
  return showBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: (){
              // do something
              print("$index");
              Navigator.of(context).pop();
            },
          );
        },
      );
    },

  );
}

///弹出loading框
showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true, //点击遮罩不关闭对话框
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Text("正在加载，请稍后..."),
            )
          ],
        ),
      );
    },
  );
}

///弹出日历选择框（风格1）
Future<DateTime> _showDatePicker1(BuildContext context) {
  var date = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: date,
    firstDate: date,
    locale: Locale('zh'),
    lastDate: date.add( //未来30天可选
      Duration(days: 30),
    ),
  );
}

///弹出日历选择框（风格2）
Future<TimeOfDay> _showDatePicker2(BuildContext context) {
  return showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (BuildContext context, Widget child) {
      return Localizations(
        locale: const Locale('zh'),
        child: child,
        delegates: <LocalizationsDelegate>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      );
    },
  );
}




///弹出日历选择框（风格3）
Future<DateTime> _showDatePicker3(BuildContext context) {
  var date = DateTime.now();
  return showCupertinoModalPopup(
    context: context,
    builder: (ctx) {
      return SizedBox(
        height: 200,
        child: CupertinoDatePicker(

          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: date,
          maximumDate: date.add(
            Duration(days: 30),
          ),
          maximumYear: date.year + 1,
          onDateTimeChanged: (DateTime value) {
            print("the date is ${value.toString()}");
          },

        ),
      );
    },
  );
}
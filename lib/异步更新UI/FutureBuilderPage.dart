import 'package:flutter/material.dart';

class FutureBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilderHomePage(),
    );
  }
}

class FutureBuilderHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FutureBuilderPageState();
  }
}

class FutureBuilderPageState extends State<FutureBuilderHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('异步更新UI'),
      ),
      body: Center(
        child:
        FutureBuilder<String>(
          future: mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // 请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              } else {
                // 请求成功，显示数据
                return Text("Contents: ${snapshot.data}");
              }
            } else {
              // 请求未结束，显示loading
              return CircularProgressIndicator();
            }
          },
        ),
//          StreamBuilder<int>(
//            stream: counter(), //
//            //initialData: ,// a Stream<int> or null
//            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//              if (snapshot.hasError)
//                return Text('Error: ${snapshot.error}');
//              switch (snapshot.connectionState) {
//                case ConnectionState.none:
//                  return Text('没有Stream');
//                case ConnectionState.waiting:
//                  return Text('等待数据...');
//                case ConnectionState.active:
//                  return Text('active: ${snapshot.data}');
//                case ConnectionState.done:
//                  return Text('Stream已关闭');
//              }
//              return null; // unreachable
//            },
//          ),
      ),
    );
  }
}

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 5), () => "我是网络加载后获取的数据");
}

Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    return i;
  });
}

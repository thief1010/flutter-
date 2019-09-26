import 'package:flutter/material.dart';

class TestSecondVC extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestSecondVCPage(),
    );
  }
}



class TestSecondVCPage extends StatefulWidget {
  @override
  _TestSecondVCState createState() => _TestSecondVCState();
}

class _TestSecondVCState extends State<TestSecondVCPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

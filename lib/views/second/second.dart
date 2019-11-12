import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondState();
  }
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('第二个页面'),
      ),
      body: new Center(
        child: new Text('第二个页面'),
      ),
    );
  }
}
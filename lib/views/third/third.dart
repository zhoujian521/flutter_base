import 'package:flutter/material.dart';

class Third extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThirdState();
  }
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('第三个页面'),
      ),
      body: new Center(
        child: new Text('第三个页面'),
      ),
    );
  }
}
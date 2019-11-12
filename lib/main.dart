import 'package:flutter/material.dart';

import 'package:flutter_base/views/root.dart';

void main() async {
  print('main.dart ==> main()');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    print('main.dart ==> build()');
    return new MaterialApp(
      title: 'base',
      home: new Scaffold(
        body: new Center(
          child: new Home(),
        ),
      ),
    );
  }
}

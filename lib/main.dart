import 'package:flutter/material.dart';
import 'package:flutter_base/views/root.dart';

import 'package:flutter_base/themes/colors.dart' as ZJColors;
import 'package:flutter_base/themes/fonts.dart' as ZJFonts;

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
      theme: new ThemeData(
        primaryColor: Color(ZJColors.primaryColor),
        backgroundColor: Color(ZJColors.backgroundColor),
        accentColor: Color(ZJColors.accentColor),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color(ZJColors.accentColor),
            fontSize: ZJFonts.body1,
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(ZJColors.primaryColor),
          size: 35.0
        ),
      ),
      home: new Scaffold(
        body: new Center(
          child: new Root(),
        ),
      ),
      debugShowCheckedModeBanner: true,
    );
  }
}

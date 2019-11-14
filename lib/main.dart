import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_base/views/root.dart';
import 'package:flutter_base/views/users/collection.dart';

import 'package:flutter_base/themes/colors.dart' as ZJColors;
import 'package:flutter_base/themes/fonts.dart' as ZJFonts;

import 'package:flutter_base/routers/application.dart';
import 'package:flutter_base/routers/routers.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final Map<String, WidgetBuilder> routes = {
    '/collection': (context) => Collection()
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'base',
      initialRoute: "/",
      routes: routes,
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
        iconTheme:
            IconThemeData(color: Color(ZJColors.primaryColor), size: 35.0),
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

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/views/users/users.dart';
import 'package:flutter_base/components/my_app_bar.dart';
import 'package:flutter_base/routers/application.dart';
import 'package:flutter_base/routers/routers.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

void onPressedSearch(BuildContext context) {
  Application.router
      .navigateTo(context, Routes.search, transition: TransitionType.native);
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: MyAppBar(
        leading: Container(
          child: ClipOval(
            child: Image.network(
              'https://hbimg.huabanimg.com/9bfa0fad3b1284d652d370fa0a8155e1222c62c0bf9d-YjG0Vt_fw658',
              scale: 15.0,
            ),
          ),
        ),
        title: new Text('首页'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => onPressedSearch(context),
          )
        ],
      ),
      drawer: Drawer(
        child: new Mine(),
      ),
      body: new Center(
        child: new Text('首页'),
      ),
    );
  }
}

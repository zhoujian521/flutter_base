import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:flutter_base/routers/application.dart';
import 'package:flutter_base/routers/routers.dart';
import 'package:flutter_base/blocs/bloc_index.dart';

import 'package:flutter_base/ui/pages/users/users.dart';
import 'package:flutter_base/ui/widgets/my_app_bar.dart';

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
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);

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
        child: new Column(
          children: <Widget>[
            FlatButton(
              child: new Text('update'),
              onPressed: () {
                bloc.configSink.add(++_counter);
              },
            ),
            StreamBuilder(
                stream: bloc.configStream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Text('$snapshot');
                }),
          ],
        ),
      ),
    );
  }
}

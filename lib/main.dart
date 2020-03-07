import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_base/blocs/user_bloc.dart';
import 'package:flutter_base/themes/index.dart' as prefix0;
import 'blocs/bloc_index.dart';

import 'package:flutter_base/routers/application.dart';
import 'package:flutter_base/routers/routers.dart';

import 'package:flutter_base/ui/pages/users/collection.dart';
import 'package:flutter_base/ui/pages/users/login_page.dart';

void main() => runApp(BlocProvider(
      bloc: ApplicationBloc(),
      child: MainApp(),
    ));

class MainApp extends StatefulWidget {
  MainApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  State<StatefulWidget> createState() {
    return _MainAppState();
  }
}

class _MainAppState extends State<MainApp> {
  final Map<String, WidgetBuilder> routes = {
    '/collection': (context) => Collection()
  };

  @override
  void initState() {
    super.initState();
    _initListener();
  }

  void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.configStream.listen((params) {
      print('~~~~~~~~~~~$params~~~~~~~~~');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'base',
      initialRoute: "/",
      routes: routes,
      theme: new ThemeData(
        primaryColor: prefix0.AppColours.app_primary,
        backgroundColor: prefix0.AppColours.app_background,
      ),
      home: new Scaffold(
        body: new Center(
          // child: new Root(),
          child: new BlocProvider(
            bloc: new UserBloc(),
            child: new LoginPage(),
          ),
        ),
      ),
      debugShowCheckedModeBanner: true,
    );
  }
}

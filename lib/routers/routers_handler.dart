import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_base/blocs/bloc_provider.dart';
import 'package:flutter_base/blocs/user_bloc.dart';
import 'package:flutter_base/ui/pages/root.dart';
import 'package:flutter_base/ui/pages/users/login_page.dart';
import 'package:flutter_base/ui/pages/users/search.dart';
import 'package:flutter_base/ui/pages/404.dart';

var rootHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('rootHandler $params');
    return new Root();
  },
);

var loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('loginHandler $params');
    return new BlocProvider(
      bloc: new UserBloc(),
      child: LoginPage(),
    );
  },
);

var searchHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('searchHandler $params');
    return new Search();
  },
);

var error404Handler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('error404Handler $params');
    return new Error404();
  },
);

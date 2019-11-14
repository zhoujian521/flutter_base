import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_base/views/users/search.dart';
import 'package:flutter_base/views/404.dart';

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

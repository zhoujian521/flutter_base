import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_base/views/users/search.dart';

var searchHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('searchHandler $params');
    return new Search();
  },
);

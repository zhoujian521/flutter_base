import 'package:fluro/fluro.dart';
import 'package:flutter_base/routers/routers_handler.dart';

class Routes {
  static String search = '/search';

  static void configureRoutes(Router router) {
    router.define(search, handler: searchHandler);
  }
}
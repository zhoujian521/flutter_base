import 'package:fluro/fluro.dart';
import 'package:flutter_base/routers/routers_handler.dart';

class Routes {
  static String search = '/search';
  static String error404 = '/error404';

  static void configureRoutes(Router router) {
    router.define(search, handler: searchHandler);
    router.define(error404, handler: error404Handler);
  }
}
import 'package:fluro/fluro.dart';
import 'package:flutter_base/routers/routers_handler.dart';

class Routes {
  static String root = '/root';
  static String login = '/login';
  static String search = '/search';
  static String error404 = '/error404';

  static void configureRoutes(Router router) {
    router.define(root, handler: rootHandler);
    router.define(login, handler: loginHandler);
    router.define(search, handler: searchHandler);
    router.define(error404, handler: error404Handler);
  }
}
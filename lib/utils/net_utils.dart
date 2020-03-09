import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import 'package:flutter_base/constant/config.dart';

Map<String, dynamic> headers = {
  'accept-language': 'zh-cn',
  'content-type': 'application/json'
};

BaseOptions options = new BaseOptions(
  baseUrl: Config.baseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
  headers: headers,
);

var dio = new Dio(options);

class NetUtils {
  static Future get(String path, [Map<String, dynamic> params]) async {
    var response;
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocDirPath = appDocDir.path;
    var dir = new Directory('$appDocDirPath/cookies');
    await dir.create();
    dio.interceptors.add(CookieManager(PersistCookieJar(dir: dir.path)));
    if (params != null) {
      response = await dio.get(path, queryParameters: params);
    } else {
      response = await dio.get(path);
    }
    return response.data;
  }

  static Future post(String path, Map<String, dynamic> params) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocDirPath = appDocDir.path;
    var dir = new Directory('$appDocDirPath/cookies');
    await dir.create();
    dio.interceptors.add(CookieManager(PersistCookieJar(dir: dir.path)));
    var response = await dio.post(path, data: params);
    return response.data;
  }
}

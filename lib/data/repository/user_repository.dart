import 'package:flutter_base/constant/constant.dart';
import 'package:flutter_base/data/model/user.dart';

class UserRepository {
  static Future login(String username, String password) async {
    try {
      var baseData = {
        "code": 0,
        "msg": '',
        "data": {
          "userName": username,
          "isLogin": true,
          "token": "ASDFGHJKLOIUYTREWQZXCVBNM"
        }
      };
      BaseData res = BaseData.fromJson(baseData);
      if (res.code != Constant.status_success) {
        return new Future.error(res.msg);
      }
      User model = User.fromJson(res.data);
      return model;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}

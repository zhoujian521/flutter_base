import 'package:flutter_base/data/api/api.dart';
import 'package:flutter_base/utils/net_utils.dart';
import 'package:flutter_base/constant/config.dart';
import 'package:flutter_base/constant/constant.dart';
import 'package:flutter_base/data/model/project.dart';
import 'package:flutter_base/data/model/base_resp.dart';

class DataRepository {
  static Future<List<Project>> getProjectList() async {
    const url = Config.baseUrl + Api.PROJECT_LIST + '/1/json?cid=294';
    var baseResp = await NetUtils.get(url);
    BaseResp res = BaseResp.fromJson(baseResp);
    
    if (res.errorCode != Constant.status_success) {
      return new Future.error(res.errorMsg);
    }
    List<Project> list;
    if (res.data != null) {
      list = res.data.datas?.map((item) {
        Project model = Project.fromJson(item);
        return model;
      })?.toList();
    }
    return list;
  }
}

enum ENV {
  PRODUCTION,
  DEV,
}

class Application {
  static ENV env = ENV.DEV;

  /// 所有获取配置的唯一入口
  Map<String, String> get config {
    if (Application.env == ENV.PRODUCTION) {
      return {};
    }
    if (Application.env == ENV.DEV) {
      return {};
    }
    return {};
  }
}

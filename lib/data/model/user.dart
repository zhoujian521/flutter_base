import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class BaseData extends Object {
  @JsonKey(name: 'data')
  Map<String, dynamic> data;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  BaseData(
    this.data,
    this.code,
    this.msg,
  );

  factory BaseData.fromJson(Map<String, dynamic> srcJson) =>
      _$BaseDataFromJson(srcJson);
  Map<String, dynamic> toJson() => _$BaseDataToJson(this);
}

@JsonSerializable()
class User extends Object {
  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'isLogin')
  bool isLogin;

  @JsonKey(name: 'token')
  String token;

  User(this.userName, this.isLogin, this.token);

  factory User.fromJson(Map<String, dynamic> srcJson) =>
      _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}


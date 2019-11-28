// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseData _$BaseDataFromJson(Map<String, dynamic> json) {
  return BaseData(json['data'] as Map<String, dynamic>, json['code'] as int,
      json['msg'] as String);
}

Map<String, dynamic> _$BaseDataToJson(BaseData instance) => <String, dynamic>{
      'data': instance.data,
      'code': instance.code,
      'msg': instance.msg
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['userName'] as String, json['isLogin'] as bool,
      json['token'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userName': instance.userName,
      'isLogin': instance.isLogin,
      'token': instance.token
    };

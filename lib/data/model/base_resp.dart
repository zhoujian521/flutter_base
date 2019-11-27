import 'package:json_annotation/json_annotation.dart';

part 'base_resp.g.dart';

@JsonSerializable()
class BaseResp extends Object {
  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  BaseResp(
    this.data,
    this.errorCode,
    this.errorMsg,
  );

  factory BaseResp.fromJson(Map<String, dynamic> srcJson) =>
      _$BaseRespFromJson(srcJson);
  Map<String, dynamic> toJson() => _$BaseRespToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'curPage')
  int curPage;

  @JsonKey(name: 'datas')
  List<dynamic> datas;

  @JsonKey(name: 'offset')
  int offset;

  @JsonKey(name: 'over')
  bool over;

  @JsonKey(name: 'pageCount')
  int pageCount;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'total')
  int total;

  Data(
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

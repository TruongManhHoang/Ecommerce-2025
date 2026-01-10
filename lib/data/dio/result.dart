import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: unused_element
part 'result.g.dart';

@JsonSerializable()
class Result {
  Result(
      {this.typeError,
      this.message,
      this.data,
      this.meta,
      this.status = "Error"});

  final String status;
  final String? typeError;
  final String? message;
  final dynamic data;
  final Meta? meta;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@JsonSerializable()
class Meta {
  int? totalItems;
  int? pageSize;
  int? currentPage;
  int? totalPages;
  int? notifyUnreadPersonalCount;
  int? notifyUnreadDeptCount;
  int? notifyUnreadCompanyCount;
  int? notifyUnreadGlobalCount;

  Meta(
      {this.totalItems,
      this.pageSize,
      this.currentPage,
      this.totalPages,
      this.notifyUnreadPersonalCount,
      this.notifyUnreadDeptCount,
      this.notifyUnreadCompanyCount,
      this.notifyUnreadGlobalCount});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      typeError: json['typeError'] as String?,
      message: json['message'] as String?,
      data: json['data'],
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      status: json['status'] as String? ?? "Error",
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'status': instance.status,
      'typeError': instance.typeError,
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      totalItems: (json['totalItems'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      notifyUnreadPersonalCount:
          (json['notifyUnreadPersonalCount'] as num?)?.toInt(),
      notifyUnreadDeptCount: (json['notifyUnreadDeptCount'] as num?)?.toInt(),
      notifyUnreadCompanyCount:
          (json['notifyUnreadCompanyCount'] as num?)?.toInt(),
      notifyUnreadGlobalCount:
          (json['notifyUnreadGlobalCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'totalItems': instance.totalItems,
      'pageSize': instance.pageSize,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'notifyUnreadPersonalCount': instance.notifyUnreadPersonalCount,
      'notifyUnreadDeptCount': instance.notifyUnreadDeptCount,
      'notifyUnreadCompanyCount': instance.notifyUnreadCompanyCount,
      'notifyUnreadGlobalCount': instance.notifyUnreadGlobalCount,
    };

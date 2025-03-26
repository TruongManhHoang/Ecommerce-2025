import 'package:ecommerce_app/data/dio/result_decoder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult with _$ApiResult {
  const factory ApiResult.apiSuccess(ResultDecoder data) = Success;

  const factory ApiResult.apiFailure(Exception error) = Failure;
}

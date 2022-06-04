import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
//결과는 에러나/ 성공 여부 리턴
@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;
  const factory Result.error(String e) = Error;
}
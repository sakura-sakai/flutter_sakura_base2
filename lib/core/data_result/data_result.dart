import 'package:freezed_annotation/freezed_annotation.dart';

import '../exceptions/exceptions.dart';

part 'data_result.freezed.dart';

@freezed
class DataResult<T> with _$DataResult<T> {
  const factory DataResult.success(T data) = Success<T>;

  const factory DataResult.failure(GenericException error) = Failure<T>;
}

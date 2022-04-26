import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../core/exceptions/exceptions.dart';

@immutable
class Token extends Equatable {
  final String value;

  Token(this.value) {
    if (value.isEmpty) {
      throw const UnauthorizedException("Don't have TOKEN");
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'token': value,
    };
  }

  @override
  List<Object?> get props => [value];
}

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../core/exceptions/exceptions.dart';

@immutable
class RefreshToken extends Equatable {
  final String value;

  RefreshToken(this.value) {
    if (value.isEmpty) {
      throw const UnauthorizedException("Don't have REFRESH TOKEN");
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'refresh_token': value,
    };
  }

  @override
  List<Object?> get props => [value];
}

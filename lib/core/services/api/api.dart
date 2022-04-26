library api_service;

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sakura_base2/core/configs/api_config/api_key_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../configs/api_config/api_config.dart';

part 'api_client.dart';

part 'api_exception.dart';

const int _unknownStatusCode = -1;

/// Config api time-out
const Duration _kConnectTimeout = Duration(seconds: 30);
const Duration _kSendTimeout = Duration(seconds: 30);
const Duration _kReceiveTimeout = Duration(seconds: 30);

/// Method
enum ApiMethod {
  get,
  post,
  patch,
  delete,
}

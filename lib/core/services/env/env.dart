library env_service;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_sakura_base2/core/configs/api_config/api_key_config.dart';

import '../../../theme/theme.dart';
import '../../configs/api_config/api_config.dart';

part '../env/env_manager.dart';

///  use it:
///
/// ```
/// flutter run --dart-define=ENV=dev --dart-define=BASE_URL=https://newsapi.org
/// ```
///

///
/// Environment(Dart Define)
///
const String kEnv = 'ENV';
const String kBaseUrlEnv = 'BASE_URL';
const String kApiKeyEnv = 'API_KEY';

///
/// ENV Config
///
const String kDebugBannerTitleEnv = 'DEBUG_BANNER_TITLE';
const String kDebugBannerColorEnv = 'DEBUG_BANNER_COLOR';
const String kAppStoreUrl = 'APP_STORE_URL';
const String kGooglePlayStoreUrl = 'GOOGLE_PLAY_STORE_URL';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';
import 'core/services/env/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// To set orientation always portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  ///Set color status bar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));

  await EnvManager.ensureInitialized();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

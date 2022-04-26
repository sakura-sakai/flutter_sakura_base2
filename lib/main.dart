import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';
import 'app/multi_language_scope.dart';
import 'core/services/env/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EnvManager.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    const MultiLanguageScope(
      child: ProviderScope(
        child: App(),
      ),
    ),
  );
}

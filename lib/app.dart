import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/utils/reponsive/app_responsive.dart';
import 'route/router.dart';
import 'theme/theme.dart';

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.read(routerProvider);
    final appRouterObserver = ref.read(routerObserverProvider);

    return DevicePreview(
      enabled: !kReleaseMode && kIsWeb,
      builder: (BuildContext context) {
        return AppResponsive(
          child: MaterialApp.router(
            title: 'Sakura Base 2',
            // Theme
            theme: kLightThemeData,
            darkTheme: kDarkThemeData,

            // Router
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: AutoRouterDelegate(
              appRouter,
              navigatorObservers: () => [appRouterObserver],
            ),

            // Locale
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            locale: (!kReleaseMode && kIsWeb)
                ? DevicePreview.locale(context)
                : null,

            // DevicePreview
            builder: DevicePreview.appBuilder,
            useInheritedMediaQuery: true,
          ),
        );
      },
    );
  }
}

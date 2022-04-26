import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../route/router.dart';
import '../theme/theme.dart';
import 'app_responsive.dart';

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
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: (!kReleaseMode && kIsWeb)
                ?  DevicePreview.locale(context)
                : context.locale,

            builder: DevicePreview.appBuilder,

            useInheritedMediaQuery: true,
          ),
        );
      },
    );
  }
}

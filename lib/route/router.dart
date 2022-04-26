library router;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/model/article_model.dart';
import '../features/auth/login/login_page.dart';
import '../features/auth/sign_up/sign_up_page.dart';
import '../features/auth/welcome/welcome_page.dart';
import '../features/home/home_page.dart';
import '../features/news/news_detail_page.dart';
import '../features/news/news_page.dart';
import '../features/splash/splash_page.dart';
import '../features/video/video_page.dart';

part 'router.gr.dart';
part 'router_observer.dart';

final routerProvider = Provider<AppRouter>((_) => AppRouter());

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      path: '/welcome',
      page: WelcomePage,
    ),
    AutoRoute(
      path: '/sign_up',
      page: SignUpPage,
    ),
    AutoRoute(
      path: '/login',
      page: LoginPage,
    ),
    AutoRoute(
      path: '/home',
      page: HomePage,
      children: <AutoRoute>[
        AutoRoute(
          path: 'news',
          page: NewsPage,
        ),
        AutoRoute(
          path: 'video',
          page: VideoPage,
        ),
      ],
    ),
    AutoRoute(
      path: '/news_detail',
      page: NewsDetailPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter._();

  static AppRouter? _instance;

  factory AppRouter() => _instance ??= AppRouter._();
}

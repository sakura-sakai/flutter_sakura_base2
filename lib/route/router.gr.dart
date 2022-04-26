// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    WelcomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const WelcomePage());
    },
    SignUpRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SignUpPage());
    },
    LoginRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    HomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    NewsDetailRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<NewsDetailRouteArgs>(
          orElse: () =>
              NewsDetailRouteArgs(article: queryParams.get('article')));
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: NewsDetailPage(key: args.key, article: args.article));
    },
    NewsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const NewsPage());
    },
    VideoRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const VideoPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(WelcomeRoute.name, path: '/welcome'),
        RouteConfig(SignUpRoute.name, path: '/sign_up'),
        RouteConfig(LoginRoute.name, path: '/login'),
        RouteConfig(HomeRoute.name, path: '/home', children: [
          RouteConfig(NewsRoute.name, path: 'news', parent: HomeRoute.name),
          RouteConfig(VideoRoute.name, path: 'video', parent: HomeRoute.name)
        ]),
        RouteConfig(NewsDetailRoute.name, path: '/news_detail')
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: '/welcome');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign_up');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [NewsDetailPage]
class NewsDetailRoute extends PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({Key? key, ArticleModel? article})
      : super(NewsDetailRoute.name,
            path: '/news_detail',
            args: NewsDetailRouteArgs(key: key, article: article),
            rawQueryParams: {'article': article});

  static const String name = 'NewsDetailRoute';
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({this.key, this.article});

  final Key? key;

  final ArticleModel? article;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [NewsPage]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: 'news');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [VideoPage]
class VideoRoute extends PageRouteInfo<void> {
  const VideoRoute() : super(VideoRoute.name, path: 'video');

  static const String name = 'VideoRoute';
}

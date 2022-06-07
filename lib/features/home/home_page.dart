import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../route/router.dart';
import '../../theme/theme.dart';
import '../../widgets/stless/assets_gen/assets.gen.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: const [
        NewsRoute(),
        VideoRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: tabsRouter.setActiveIndex,
          iconSize: 20,
          items: [
            BottomNavigationBarItem(
              icon: Assets.svgs.news.svg(
                width: 20,
                color: tabsRouter.current.name == NewsRoute.name
                    ? kLightThemeData.colorScheme.secondary
                    : kLightThemeData.disabledColor,
              ),
              label: 'New',
            ),
            BottomNavigationBarItem(
              icon: Assets.svgs.video.svg(
                width: 20,
                color: tabsRouter.current.name == VideoRoute.name
                    ? kLightThemeData.colorScheme.secondary
                    : kLightThemeData.disabledColor,
              ),
              label: 'Video',
            ),
          ],
        );
      },
    );
  }
}

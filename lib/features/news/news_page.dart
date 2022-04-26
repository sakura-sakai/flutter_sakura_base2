import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/theme.dart';
import '../../widgets/elements/loading/indicator.dart';
import '../../widgets/elements/text_view.dart';
import 'elements/article_item.dart';
import 'news_controller.dart';

class NewsPage extends HookConsumerWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsCtrlProvider.select((value) => value.news));

    useMemoized(ref.read(newsCtrlProvider).fetchNews, []);

    return Scaffold(
      appBar: AppBar(
        title: const TextView(
          'New Page',
          fontColor: FontColor.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.read(newsCtrlProvider).fetchNews(),
        child: news.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.articles.length,
              itemBuilder: (_, index) {
                return ArticleItem(article: data.articles[index]);
              },
            );
          },
          error: (_, __) {
            return const Center(
              child: TextView('fetchNews error'),
            );
          },
          loading: () {
            return const Center(
              child: Indicator(radius: 16),
            );
          },
        ),
      ),
    );
  }
}

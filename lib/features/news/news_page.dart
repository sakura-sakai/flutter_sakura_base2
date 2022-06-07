import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/theme.dart';
import '../../widgets/stless/loading/indicator.dart';
import '../../widgets/stless/text_view.dart';
import 'news_view_model.dart';
import 'stless/article_item.dart';

class NewsPage extends HookConsumerWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsVMProvider.select((value) => value.news));

    useMemoized(ref.read(newsVMProvider).fetchNews, []);

    return Scaffold(
      appBar: AppBar(
        title: const TextView(
          'New Page',
          fontColor: FontColor.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.read(newsVMProvider).fetchNews(),
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

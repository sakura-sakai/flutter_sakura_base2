import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../data/model/article_model.dart';
import '../../route/router.dart';
import '../../widgets/elements/image/image.dart';

class NewsDetailPage extends HookWidget {
  const NewsDetailPage({
    Key? key,
    @QueryParam('article') this.article,
  }) : super(key: key);

  final ArticleModel? article;

  @override
  Widget build(BuildContext context) {
    assert(article != null, "Article is required.");

    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: article!,
            child: networkImage(article?.urlImage),
          ),
        ),
        onTap: AppRouter().pop,
      ),
    );
  }
}

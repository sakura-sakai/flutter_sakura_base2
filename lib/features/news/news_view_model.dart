import 'dart:math';

import 'package:flutter_sakura_base2/core/utils/extensions/date_time.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/view_model/view_model.dart';
import '../../data/model/news_model.dart';
import '../../data/repositories/news_repository.dart';
import '../../data/request_param/news_request_params.dart';


final newsVMProvider = ChangeNotifierProvider(
  (ref) => NewsViewModel(ref.read),
);

class NewsViewModel extends ViewModel {
  NewsViewModel(Reader reader) : super(reader);

  final NewsRepository newsRepository = NewsRepository();

  AsyncValue<NewsModel> news = const AsyncLoading();

  Future<void> fetchNews() async {
    try {
      final request = NewsRequestParams(
        query: ['anim', 'manga'][Random().nextInt(2)],
        from: DateTime.now()
            .subtract(
              const Duration(days: 28),
            )
            .formatYYYYMMdd(),
      );

      final newsData = await newsRepository.getNews(request);

      news = AsyncData(newsData);
    } catch (e) {
      news = AsyncError(e);
      handleExceptions(e);
    }

    updateState();
  }
}

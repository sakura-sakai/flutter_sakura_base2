import '../../core/exceptions/exceptions.dart';

import '../../core/services/api/api.dart';
import '../model/news_model.dart';
import '../request_param/news_request_params.dart';

class NewsRepository {
  NewsRepository([ApiClient? client]) : _client = client ?? ApiClient();

  final ApiClient _client;

  Future<NewsModel> getNews(NewsRequestParams request) async {
    try {
      final response = await _client.invokeAPI(
        '/v2/everything',
        apiMethod: ApiMethod.get,
        queryParameters: request.toMap(),
      );

      return NewsModel.fromJson(response.data!);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }
}

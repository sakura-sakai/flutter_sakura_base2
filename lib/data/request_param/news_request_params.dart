import '../../core/exceptions/exceptions.dart';

class NewsRequestParams {
  NewsRequestParams({
    required this.query,
    required this.from,
    this.sortBy = 'publishedAt',
    this.language = 'en',
  }) {
    if (query.isEmpty) {
      throw NotFoundException('query');
    }

    if (from.isEmpty) {
      throw NotFoundException('from');
    }
  }

  final String query;
  final String from;
  final String? sortBy;
  final String? language;

  Map<String, dynamic> toMap() {
    return {
      r'q': query,
      r'from': from,
      r'sortBy': sortBy,
      r'language': language,
    };
  }
}

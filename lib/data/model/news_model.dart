import 'package:equatable/equatable.dart';

import 'article_model.dart';

class NewsModel extends Equatable {
  const NewsModel({
    required this.articles,
  });

  final List<ArticleModel> articles;

  @override
  List<Object?> get props => [articles];

  @override
  bool? get stringify => true;

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      articles: ArticleModel.listFromJson(json['articles']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'articles': articles,
    };
  }
}

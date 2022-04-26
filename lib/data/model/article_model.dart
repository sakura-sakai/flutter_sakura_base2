import 'package:equatable/equatable.dart';

class ArticleModel extends Equatable {
  const ArticleModel({
    required this.title,
    required this.urlImage,
  });

  final String title;
  final String urlImage;

  @override
  List<Object?> get props => [
        title,
        urlImage,
      ];

  @override
  bool? get stringify => true;

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? '',
      urlImage: json['urlToImage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'urlToImage': urlImage,
    };
  }

  static List<ArticleModel> listFromJson(dynamic json) {
    if (json is! List || json.isEmpty) {
      return <ArticleModel>[];
    }

    return json.map<ArticleModel>((e) {
      return ArticleModel.fromJson(e);
    }).toList();
  }
}

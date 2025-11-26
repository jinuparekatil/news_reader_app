import 'dart:convert';

class NewsModel {
  final String author;
  final String title;
  final String description;
  final String image;
  final String date;
  final String url;
  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.image,
    required this.date,
    required this.url,
  });
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      author: json['author'] ?? 'Unknown',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['urlToImage'] ?? '',
      date: json['publishedAt'] ?? '',
      url: json['url'] ?? '',
    );
  }
}

class NewsResponse {
  final List<NewsModel> news;
  final String error;
  NewsResponse({required this.news, required this.error});
  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      news: (json["articles"] as List).map((e) => NewsModel.fromJson(e)).toList(),
      error:  "",
    );
  }
  NewsResponse.showError(String errorValue) : news = [], error = errorValue;
}

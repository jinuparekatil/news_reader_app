import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_reader_app/data/models/newsmodel.dart';

class Newsrepository {
  Future<NewsResponse> getNews(String category, String country) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=d346389fdafc404ea07a4068f1738fd1";
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
      return compute(parseNewsResponse, response.body);
    } catch (e) {
      print("Error fetching news");
      return NewsResponse.showError(e.toString());
    }
  }
}

/// Background isolate function
NewsResponse parseNewsResponse(String responseBody) {
  final jsonMap = jsonDecode(responseBody);
  return NewsResponse.fromJson(jsonMap);
}

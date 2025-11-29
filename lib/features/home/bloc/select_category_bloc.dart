import 'dart:async';

import 'package:news_reader_app/core/constants/categories.dart';

class SelectCategoryBloc {
  final StreamController _categoryController = StreamController.broadcast();
  Stream get categoryStream => _categoryController.stream;
  String defaultCategory = newsCategories[0];
  void selectCategory(String category) {
    _categoryController.sink.add(category);
  }

  void dispose() {
    _categoryController.close();
  }
}

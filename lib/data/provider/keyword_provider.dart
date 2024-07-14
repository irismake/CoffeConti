import 'package:flutter/material.dart';

import '../api_service.dart';
import '../models/keyword_model.dart';

class KeywordsProvider with ChangeNotifier {
  final List<KeywordModel> _keywordsModel = [];
  bool getKeywords = false;
  int? _categoryId;

  int? get categoryId => _categoryId;
  List<KeywordModel> get keywordsModel => _keywordsModel;

  set selectedCategory(int? categoryId) {
    _categoryId = categoryId;
  }

  void saveKeyword() async {
    if (!getKeywords) {
      List<KeywordModel> keywords = await ApiService.getKeywords();
      _keywordsModel.clear();
      for (var keyword in keywords) {
        _keywordsModel.add(keyword);
        print(_keywordsModel);
      }
      print('saveKeyword');
      getKeywords = true;
    }
  }

  KeywordModel getKeywordsData() {
    KeywordModel category = _keywordsModel.firstWhere(
      (element) => element.categoryId == categoryId,
      orElse: () => KeywordModel(categoryId: -1, name: '', keywords: []),
    );
    return category;
  }
}

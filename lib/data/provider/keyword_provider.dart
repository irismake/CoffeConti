import 'package:flutter/material.dart';

import '../api_service.dart';
import '../models/keyword_model.dart';

class KeywordsProvider with ChangeNotifier {
  final List<KeywordModel> _keywordModels = [];
  final List<KeywordData> _keywordDatas = [];
  int? _categoryId;

  int? get categoryId => _categoryId;
  List<KeywordModel> get keywordModels => _keywordModels;
  List<KeywordData> get keywordDatas => _keywordDatas;

  set selectedCategory(int? categoryId) {
    _categoryId = categoryId;
  }

  Future<void> fetchAllData() async {
    List<KeywordModel> keywordModels = await ApiService.getKeywords();
    _keywordModels.clear();
    for (var keywordModel in keywordModels) {
      _keywordModels.add(keywordModel);
    }
    print('saveKeyword');
  }

  void getKeywords() {
    KeywordModel keywordModel = _keywordModels.firstWhere(
      (element) => element.categoryId == categoryId,
      orElse: () => KeywordModel(categoryId: -1, name: '', keywords: []),
    );
    _keywordDatas.clear();
    for (var keyword in keywordModel.keywords) {
      _keywordDatas.add(keyword);
    }
    notifyListeners();
  }
}

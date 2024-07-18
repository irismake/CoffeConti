import 'package:flutter/material.dart';

import '../api_service.dart';
import '../models/keyword_model.dart';

class KeywordsProvider with ChangeNotifier {
  final List<KeywordModel> _getKeywordModels = [];
  final List<KeywordData> _showKeywordDatas = [];
  final List<String> _categoryNames = [];
  int? _prevCategoryId;
  int? _curCategoryId;
  int? _selectedCategoryId;
  final List<KeywordData> _selectedKeywordDatas = [];

  List<KeywordData> get showKeywordDatas => _showKeywordDatas;
  List<String> get categoryNames => _categoryNames;
  int? get curCategoryId => _curCategoryId;
  int? get selectedCategoryId => _selectedCategoryId;
  List<KeywordData> get selectedKeywordDatas => _selectedKeywordDatas;

  set saveTempCategoryId(int? tempCategoryId) {
    _curCategoryId = tempCategoryId;
    print('현재 카테고리 $_curCategoryId');
  }

  Future<void> getAllData() async {
    List<KeywordModel> keywordModels = await ApiService.getKeywords();
    _getKeywordModels.clear();
    _categoryNames.clear();
    for (var keywordModel in keywordModels) {
      _getKeywordModels.add(keywordModel);
      _categoryNames.add(keywordModel.name);
    }
    print('get all keyword data');
  }

  Future<void> fetchCategoryData() async {
    KeywordModel keywordModel = _getKeywordModels.firstWhere(
      (element) => element.categoryId == _curCategoryId,
      orElse: () => KeywordModel(categoryId: -1, name: '', keywords: []),
    );
    _showKeywordDatas.clear();
    for (var keyword in keywordModel.keywords) {
      _showKeywordDatas.add(keyword);
    }
    print('fetchCategoryData');
  }

  void changeKeywordState(int keywordId) {
    final keyword = _showKeywordDatas.firstWhere(
      (element) => element.id == keywordId,
    );
    if (_prevCategoryId != _curCategoryId) {
      resetAllSelections();
    }
    _prevCategoryId = _curCategoryId;
    keyword.isSelected = !keyword.isSelected;
    notifyListeners();
  }

  void resetAllSelections() {
    for (var category in _getKeywordModels) {
      for (var keyword in category.keywords) {
        keyword.isSelected = false;
      }
    }
  }

  bool getKeywordState(int keywordId) {
    return _showKeywordDatas
        .firstWhere(
          (element) => element.id == keywordId,
        )
        .isSelected;
  }

  void getSelectedKeywords() {
    _selectedKeywordDatas.clear();
    for (var category in _getKeywordModels) {
      for (var keyword in category.keywords) {
        if (keyword.isSelected == true) {
          _selectedCategoryId = category.categoryId;
          _selectedKeywordDatas.add(keyword);
        }
      }
    }
    print('최종 카테고리 $_selectedCategoryId');
    notifyListeners();
  }
}

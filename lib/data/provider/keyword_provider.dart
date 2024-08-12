import 'package:flutter/material.dart';

import '../api_service.dart';
import '../models/keyword_model.dart';

class KeywordsProvider with ChangeNotifier {
  final List<KeywordModel> _getKeywordModels = [];
  final List<KeywordData> _showKeywordDatas = [];
  final List<String> _categoryNames = [];
  int? _prevCategoryId;
  int _curCategoryId = 0;
  int? _selectedCategoryId;
  final List<int> _selectedKeywordIds = [];
  List<KeywordData> _selectedKeywordDatas = [];
  bool _searchButtonState = false;

  List<KeywordData> get showKeywordDatas => _showKeywordDatas;
  List<String> get categoryNames => _categoryNames;
  int? get curCategoryId => _curCategoryId;
  int? get selectedCategoryId => _selectedCategoryId;
  List<int> get selectedKeywordIds => _selectedKeywordIds;
  List<KeywordData> get selectedKeywordDatas => _selectedKeywordDatas;
  bool get searchButtonState => _searchButtonState;

  set saveTempCategoryId(int tempCategoryId) {
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
    fetchCategoryData();
  }

  Future<void> fetchCategoryData() async {
    KeywordModel keywordModel = _getKeywordModels.firstWhere(
      (element) => element.categoryId == _curCategoryId,
      orElse: () => KeywordModel(
          categoryId: -1, categoryGroupCode: '', name: '', keywords: []),
    );
    _showKeywordDatas.clear();
    for (var keyword in keywordModel.keywords) {
      _showKeywordDatas.add(keyword);
    }
    print('fetch category data $_showKeywordDatas');
    checkSearchButtonState();
  }

  void changeKeywordState(int keywordId) {
    if (_prevCategoryId != _curCategoryId) {
      _selectedKeywordIds.clear();
    }
    _prevCategoryId = _curCategoryId;
    if (_selectedKeywordIds.contains(keywordId)) {
      _selectedKeywordIds.remove(keywordId);
    } else {
      _selectedKeywordIds.add(keywordId);
    }
    checkSearchButtonState();
    notifyListeners();
  }

  void checkSearchButtonState() {
    _searchButtonState = _showKeywordDatas
        .any((element) => _selectedKeywordIds.contains(element.id));
    notifyListeners();
  }

  void getSelectedKeywords() {
    _selectedKeywordDatas.clear();
    final keywords = _getKeywordModels
        .firstWhere((element) => element.categoryId == _curCategoryId)
        .keywords;

    _selectedKeywordDatas = keywords
        .where((element) => _selectedKeywordIds.contains(element.id))
        .toList();
    _selectedCategoryId = _curCategoryId;
    print('최종 카테고리 $_selectedCategoryId');
    print('최종 데이터 $_selectedKeywordDatas');
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

import '../api_service.dart';
import '../models/keyword_model.dart';

class KeywordsProvider with ChangeNotifier {
  final List<KeywordModel> _keywordModels = [];
  final List<KeywordData> _keywordDatas = [];
  final List<String> _categoryNames = [];
  List<int> _tempKeywordIds = [];
  List<int> _selectedKeywordIds = [];
  final List<String> _selectedKeywordsName = [];

  int? _tempCategoryId;
  int? _selectedCategoryId;

  int? get tempCategoryId => _tempCategoryId;
  int? get selectedCategoryId => _selectedCategoryId;
  List<KeywordModel> get keywordModels => _keywordModels;
  List<KeywordData> get keywordDatas => _keywordDatas;
  List<String> get categoryNames => _categoryNames;
  List<int> get tempKeywordIds => _tempKeywordIds;
  List<String> get selectedKeywordsName => _selectedKeywordsName;

  set saveTempCategoryId(int? tempCategoryId) {
    _tempCategoryId = tempCategoryId;
  }

  set saveKeywordIds(List<int> selectedKeywordIds) {
    _selectedKeywordIds = selectedKeywordIds;
  }

  Future<void> getAllData() async {
    List<KeywordModel> keywordModels = await ApiService.getKeywords();
    _keywordModels.clear();
    _categoryNames.clear();
    for (var keywordModel in keywordModels) {
      _keywordModels.add(keywordModel);
      _categoryNames.add(keywordModel.name);
    }

    print('fetch keyword data');
  }

  void fetchCategoryData() {
    KeywordModel keywordModel = _keywordModels.firstWhere(
      (element) => element.categoryId == tempCategoryId,
      orElse: () => KeywordModel(categoryId: -1, name: '', keywords: []),
    );
    _keywordDatas.clear();
    for (var keyword in keywordModel.keywords) {
      _keywordDatas.add(keyword);
    }
  }

  Future<void> initializeData() async {
    await getAllData();
    fetchCategoryData();
    notifyListeners();
  }

  void saveTempKeywordId(int keywordId) {
    if (_tempKeywordIds.contains(keywordId)) {
      _tempKeywordIds.remove(keywordId);
    } else {
      _tempKeywordIds.add(keywordId);
    }
    notifyListeners();
  }

  void resetTempKeywordId() {
    _tempKeywordIds = [];

    ;
  }

  void getSelectedKeywords() {
    _selectedKeywordsName.clear();
    print('selected $_selectedKeywordIds');
    for (var selectedKeywordId in _selectedKeywordIds) {
      String keywordName = keywordDatas
          .firstWhere(
            (element) => element.id == selectedKeywordId,
          )
          .name;
      _selectedKeywordsName.add(keywordName);
    }
    _selectedCategoryId = _tempCategoryId;
    print(_selectedKeywordsName);
    notifyListeners();
  }
}

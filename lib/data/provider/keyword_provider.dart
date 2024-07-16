import 'package:flutter/material.dart';

import '../api_service.dart';
import '../models/keyword_model.dart';

class KeywordsProvider with ChangeNotifier {
  final List<KeywordModel> _getKeywordModels = [];
  final List<KeywordData> _keywordDatas = [];
  final List<String> _categoryNames = [];
  int? _tempCategoryId;
  int? _selectedCategoryId;
  List<int> _tempKeywordIds = [];
  List<int> _selectedKeywordIds = [];
  final List<KeywordData> _selectedKeywordDatas = [];

  List<KeywordData> get keywordDatas => _keywordDatas;
  List<String> get categoryNames => _categoryNames;
  int? get tempCategoryId => _tempCategoryId;
  int? get selectedCategoryId => _selectedCategoryId;
  List<int> get tempKeywordIds => _tempKeywordIds;
  List<KeywordData> get selectedKeywordDatas => _selectedKeywordDatas;

  set saveTempCategoryId(int? tempCategoryId) {
    _tempCategoryId = tempCategoryId;
  }

  set saveKeywordIds(List<int> selectedKeywordIds) {
    _selectedKeywordIds = selectedKeywordIds;
  }

  Future<void> getAllData() async {
    List<KeywordModel> keywordModels = await ApiService.getKeywords();
    _getKeywordModels.clear();
    _categoryNames.clear();
    for (var keywordModel in keywordModels) {
      _getKeywordModels.add(keywordModel);
      _categoryNames.add(keywordModel.name);
    }

    print('fetch keyword data');
  }

  void fetchCategoryData() {
    KeywordModel keywordModel = _getKeywordModels.firstWhere(
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
    _selectedKeywordDatas.clear();
    print('selected $_selectedKeywordIds');
    for (var selectedKeywordId in _selectedKeywordIds) {
      final keywordData = _keywordDatas.firstWhere(
        (element) => element.id == selectedKeywordId,
      );

      _selectedKeywordDatas.add(keywordData);
    }
    _selectedCategoryId = _tempCategoryId;
    print(_selectedKeywordDatas);
    notifyListeners();
  }
}

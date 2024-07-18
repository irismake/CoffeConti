class KeywordModel {
  final int categoryId;
  final String name;
  final List<KeywordData> keywords;

  KeywordModel({
    required this.categoryId,
    required this.name,
    required this.keywords,
  });

  KeywordModel.fromJson(Map<String, dynamic> json)
      : categoryId = json['category_id'],
        name = json['name'],
        keywords = (json['keywords'] as List<dynamic>)
            .map((keyword) => KeywordData.fromJson(keyword))
            .toList();
}

class KeywordData {
  final int id;
  final String name;
  bool _isSelected;

  KeywordData({
    required this.id,
    required this.name,
    required bool isSelected,
  }) : _isSelected = isSelected;

  bool get isSelected => _isSelected;

  set isSelected(bool value) {
    _isSelected = value;
  }

  KeywordData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        _isSelected = false;
}

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
  final bool isSelected;

  KeywordData({
    required this.id,
    required this.name,
    required this.isSelected,
  });

  KeywordData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        isSelected = json['is_selected'];
}

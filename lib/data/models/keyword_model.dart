import 'dart:convert';

class KeywordModel {
  final int categoryId;
  final List<KeywordData> kewords;

  KeywordModel({
    required this.categoryId,
    required this.kewords,
  });
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




// class KeywordModel {
//   final int id;
//   final String name;
//   final List<KeywordData> keywords;

//   KeywordModel({
//     required this.id,
//     required this.name,
//     required this.keywords,
//   });

//   factory KeywordModel.fromJson(Map<String, dynamic> json) {
//     var keywordList = json['keywords'] as List;
//     List<KeywordData> keywordDataList = keywordList.map((i) => KeywordData.fromJson(i)).toList();

//     return KeywordModel(
//       id: json['id'],
//       name: json['name'],
//       keywords: keywordDataList,
//     );
//   }
// }

// class KeywordData {
//   final int id;
//   final String name;
//   bool isSelected;

//   KeywordData({
//     required this.id,
//     required this.name,
//     required this.isSelected,
//   });

//   factory KeywordData.fromJson(Map<String, dynamic> json) {
//     return KeywordData(
//       id: json['id'],
//       name: utf8.decode(json['name'].toString().codeUnits),
//       isSelected: json['is_selected'] ?? false,
//     );
//   }
// }
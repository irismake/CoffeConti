import 'dart:convert';
import 'package:coffeeconti/data/models/keyword_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = '';

  static const List<Map<String, dynamic>> kewordJsonData = [
    {
      "category_id": 0,
      "name": "카페",
      "keywords": [
        {
          "id": 0,
          "name": "공부",
          "is_selected": false,
        },
        {
          "id": 1,
          "name": "뷰",
          "is_selected": false,
        },
      ],
    },
    {
      "category_id": 1,
      "name": "음식점",
      "kewords": [
        {
          "id": 0,
          "name": "야간영업",
          "is_selected": false,
        },
        {
          "id": 1,
          "name": "브레이크타입",
          "is_selected": false,
        },
      ],
    },
  ];

  static Future<List<KeywordData>> getKeywords(int categoryId) async {
    try {
      // final getKeywordsResponse = await http.get(
      //   Uri.parse('$baseUrl/'),
      // );
      // if (getKeywordsResponse.statusCode == 200) {
      //   final getKeywordsResponseData = json.decode(getKeywordsResponse.body);

      //   return getKeywordsResponseData['category_id: $categoryId'];

      // } else {
      //   throw Exception(
      //       'Response code error <getKeywords> : ${getKeywordsResponse.statusCode}');
      // }

      // Find the category with the given categoryId
      final category = kewordJsonData.firstWhere(
        (element) => element['category_id'] == categoryId,
        orElse: () => {},
      );

      if (category.isEmpty) {
        throw Exception('Category not found');
      }

      // Convert the keywords to a list of KeywordData
      List<KeywordData> keywords = (category['keywords'] as List)
          .map((keyword) => KeywordData.fromJson(keyword))
          .toList();

      return keywords;
    } catch (e) {
      throw Exception('Request error <getKeywords> : $e');
    }
  }
}

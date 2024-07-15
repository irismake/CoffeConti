import 'dart:convert';
import 'package:coffeeconti/data/models/keyword_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = '';

  static const List<Map<String, dynamic>> keywordJsonData = [
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
        {
          "id": 2,
          "name": "수다",
          "is_selected": false,
        },
        {
          "id": 3,
          "name": "24시간",
          "is_selected": false,
        },
        {
          "id": 4,
          "name": "늦은 마감",
          "is_selected": false,
        },
        {
          "id": 5,
          "name": "이른 오픈",
          "is_selected": false,
        },
        {
          "id": 6,
          "name": "복층",
          "is_selected": false,
        },
        {
          "id": 7,
          "name": "감성",
          "is_selected": false,
        },
        {
          "id": 8,
          "name": "디저트",
          "is_selected": false,
        },
        {
          "id": 9,
          "name": "테이크 아웃",
          "is_selected": false,
        },
        {
          "id": 10,
          "name": "싼가격",
          "is_selected": false,
        },
        {
          "id": 11,
          "name": "펫 프렌들리",
          "is_selected": false,
        },
        {
          "id": 12,
          "name": "노키즈존",
          "is_selected": false,
        },
        {
          "id": 13,
          "name": "드라이브 스루",
          "is_selected": false,
        },
        {
          "id": 14,
          "name": "딜리버리",
          "is_selected": false,
        },
        {
          "id": 15,
          "name": "평점 4.0이상",
          "is_selected": false,
        },
      ],
    },
    {
      "category_id": 1,
      "name": "음식점",
      "keywords": [
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
        {
          "id": 2,
          "name": "가성비",
          "is_selected": false,
        },
      ],
    },
  ];

  static Future<List<KeywordModel>> getKeywords() async {
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

      // Convert the keywords to a list of KeywordData
      List<KeywordModel> keywordModels =
          keywordJsonData.map((json) => KeywordModel.fromJson(json)).toList();

      return keywordModels;
    } catch (e) {
      throw Exception('Request error <getKeywords> : $e');
    }
  }
}

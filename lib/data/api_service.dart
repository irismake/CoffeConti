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
        },
        {
          "id": 1,
          "name": "뷰",
        },
        {
          "id": 2,
          "name": "수다",
          "is_selected": false,
        },
        {
          "id": 3,
          "name": "24시간",
        },
        {
          "id": 4,
          "name": "늦은 마감",
        },
        {
          "id": 5,
          "name": "이른 오픈",
        },
        {
          "id": 6,
          "name": "복층",
        },
        {
          "id": 7,
          "name": "감성",
        },
        {
          "id": 8,
          "name": "디저트",
        },
        {
          "id": 9,
          "name": "테이크 아웃",
        },
        {
          "id": 10,
          "name": "싼가격",
        },
        {
          "id": 11,
          "name": "펫 프렌들리",
        },
        {
          "id": 12,
          "name": "노키즈존",
        },
        {
          "id": 13,
          "name": "드라이브 스루",
        },
        {
          "id": 14,
          "name": "딜리버리",
        },
        {
          "id": 15,
          "name": "평점 4.0이상",
        },
      ],
    },
    {
      "category_id": 1,
      "name": "음식점",
      "keywords": [
        {
          "id": 16,
          "name": "야간영업",
        },
        {
          "id": 17,
          "name": "브레이크타입",
        },
        {
          "id": 18,
          "name": "가성비",
        },
      ],
    },
    {
      "category_id": 2,
      "name": "편의점",
      "keywords": [],
    },
    {
      "category_id": 3,
      "name": "주유소",
      "keywords": [],
    },
    {
      "category_id": 4,
      "name": "주차장",
      "keywords": [],
    },
    {
      "category_id": 5,
      "name": "병원",
      "keywords": [],
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

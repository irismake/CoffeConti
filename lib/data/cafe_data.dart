import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CafeDataFetcher {
  static Future<Map<String, String>> fetchCafeDetails(
      String placeId, String apiKey) async {
    final apiUrl = 'https://maps.googleapis.com/maps/api/place/details/json?'
        'place_id=$placeId&'
        'fields=name,opening_hours&'
        'key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      final result = decodedData['result'] as Map<String, dynamic>;

      final name = result['name'] as String;
      final openingHours = result['opening_hours'] ?? {};
      final periods = openingHours['periods'] as List<dynamic>;

      if (periods != null && periods.isNotEmpty) {
        final firstPeriod = periods.first;
        final openTime = firstPeriod['open']['time'] as String;
        final closeTime = firstPeriod['close']['time'] as String;
        return {
          'name': name,
          'openingTime': openTime,
          'closingTime': closeTime,
        };
      } else {
        return {
          'name': name,
          'openingTime': 'Opening hours not available',
          'closingTime': 'Opening hours not available',
        };
      }
    } else {
      throw Exception('Failed to fetch cafe details');
    }
  }
}

Future<void> fetchCafesData() async {
  final cafePlaceId = 'ChIJIX3RjJWkfDURfvJeW7iVmcA';
  final apiKey = 'AIzaSyDuffSA5RQdjpsvpirWS_0tom8G9dxYPxY';

  try {
    final cafeDetails =
        await CafeDataFetcher.fetchCafeDetails(cafePlaceId, apiKey);
    print('Cafe Name: ${cafeDetails['name']}');
    print('Opening Time: ${cafeDetails['openingTime']}');
    print('Closing Time: ${cafeDetails['closingTime']}');
  } catch (e) {
    print('Error retrieving cafe details: $e');
  }
}

// Example usage in a Flutter widget
class CafeData extends StatefulWidget {
  @override
  _CafeDataState createState() => _CafeDataState();
}

class _CafeDataState extends State<CafeData> {
  @override
  void initState() {
    super.initState();
    fetchCafesData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // Widget code...
  }
}

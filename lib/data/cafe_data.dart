import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CafeDataFetcher {
  static Future<List<Map<String, dynamic>>> fetchCafes(LatLng location) async {
    final apiKey = 'AIzaSyB2ZY98nBaNsTZ2Bf4AZ2ZpPonJaGRKWzs';

    final apiUrl =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        'location=37.5665,126.9780&'
        'radius=1000&'
        'type=cafe&'
        'key=$apiKey';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      final results = decodedData['results'] as List<dynamic>;

      final cafes = results.map<Map<String, dynamic>>((result) {
        final name = result['name'];
        final rating = result['rating'];
        final location = result['geometry']['location'];
        final openingHours = result['opening_hours'] ?? {};

        return {
          'name': name,
          'rating': rating,
          'location': location,
          'openingHours': openingHours,
        };
      }).toList();

      // Print the cafe data in the debug console
      cafes.forEach((cafe) {
        print('Name: ${cafe['name']}');
        print('Rating: ${cafe['rating']}');
        print('Location: ${cafe['location']}');
        print('Opening Hours: ${cafe['openingHours']}');
        print('------------------------------');
      });
      print(cafes);
      return cafes;
    } else {
      throw Exception('Failed to fetch cafe data');
    }
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

  Future<void> fetchCafesData() async {
    final location = LatLng(37.5665, 126.9780); // Replace with desired location
    await CafeDataFetcher.fetchCafes(location);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // Widget code...
  }
}

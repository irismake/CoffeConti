import 'package:coffeeconti/tabs/map.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:naver_map_plugin/naver_map_plugin.dart';

import 'models/cafe_name_model.dart';

class CafeDataApi {
  static Position? _currentPosition;
  static final baseUrl =
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json';

  static Future<Position> getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    _currentPosition = position;
    print(_currentPosition);
    return position;
  }

  // Future<Position> getLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Check if location services are enabled
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     print('Location services are disabled.');
  //   }

  //   // Check if the app has permission to access the location
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission != LocationPermission.whileInUse &&
  //         permission != LocationPermission.always) {
  //       print('Location permissions are denied.');
  //     }
  //   }
  //   Position position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );

  //   print('Latitude: ${position.latitude}');
  //   print('Longitude: ${position.longitude}');
  //   return position;
  // }

  Future<String?> retrieveOperatingHours(String apiKey, String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=opening_hours&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    final openingHours = data['result']['opening_hours'];

    if (openingHours != null) {
      return openingHours['weekday_text'].join('\n');
    }

    return null;
  }

  static Future getCafeName() async {
    final apiKey = 'AIzaSyDuffSA5RQdjpsvpirWS_0tom8G9dxYPxY';
    final latitude = 37.54897399440669;
    final longitude = 127.05409784297879;
    final radius = '1000';
    final url = Uri.parse(
        '$baseUrl?location=$latitude,$longitude&radius=$radius&keyword=cafe&key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String jsonData = response.body;
      Map<String, dynamic> cafeData = json.decode(jsonData);

      // String nextPageToken = cafeData['next_page_token'];
      // print('Next Page Token: $nextPageToken');

      List<dynamic> results = cafeData['results'];
      List<CoffeeShop> coffeeShops = [];
      for (var result in results) {
        coffeeShops.add(CoffeeShop.fromJson(result));
      }

      for (var shop in coffeeShops) {
        print('Name: ${shop.name}');
        print('Rating: ${shop.rating}');
        print('Vicinity: ${shop.vicinity}');
        print('-------------------------');
      }
    }
  }
}

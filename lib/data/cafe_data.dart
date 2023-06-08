import 'package:coffeeconti/tabs/map.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:naver_map_plugin/naver_map_plugin.dart';

class CafeDataApi {
  static Position? _currentPosition;

  static Future<Position> getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    _currentPosition = position;
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

  void fetchCafeDetails() {
    final apiKey = 'AIzaSyDuffSA5RQdjpsvpirWS_0tom8G9dxYPxY';
    final latitude = _currentPosition!.latitude;
    final longitude = _currentPosition!.longitude;
    final radius = '1000';
    final keyword = 'cafe';

    final url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=$radius&keyword=$keyword&key=$apiKey';

    http.get(Uri.parse(url)).then((response) {
      final data = json.decode(response.body);

      final cafes = data['results'];

      for (var cafe in cafes) {
        final name = cafe['name'];
        final placeId = cafe['place_id'];

        // Retrieve the operating hours using the place details request
        retrieveOperatingHours(apiKey, placeId).then((hours) {
          if (hours != null) {
            print('$name: Operating Hours: $hours');
          } else {
            print('$name: No operating hours available.');
          }
        });
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }
}

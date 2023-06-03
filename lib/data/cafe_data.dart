import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:naver_map_plugin/naver_map_plugin.dart';

import '../tabs/map.dart';

class CafeData extends StatefulWidget {
  const CafeData({super.key});

// Example usage in a Flutter widget

  @override
  State<CafeData> createState() => _CafeDataState();
}

class _CafeDataState extends State<CafeData> {
  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    setState(() {
      _goToCurrentPosition().then((position) {
        currentPosition = position;
        print("check ${position.latitude},${position.longitude}");
      }).onError((error, stacktrace) => null);
      fetchCafeDetails();
      CafeMap(currentPosition: currentPosition);
    });
  }

  Future<Position> _goToCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    return position;
  }

// Example usage in a Flutter widget
  void fetchCafeDetails() {
    final apiKey = 'AIzaSyDuffSA5RQdjpsvpirWS_0tom8G9dxYPxY';
    final latitude = currentPosition?.latitude;
    final longitude = currentPosition?.longitude;
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}

import 'package:flutter_naver_map/flutter_naver_map.dart';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart' show AssetImage;
import 'package:flutter/widgets.dart' show AssetImage;

import 'models/cafe_name_model.dart';

class CafeDataApi {
  static final baseUrl =
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json';

  static Future<List<String>> getCafePlaceId(Position position) async {
    List<CafePlaceIdModel> coffeeShops = [];

    List<String> cafePlaceIds = [];
    final apiKey = 'AIzaSyDuffSA5RQdjpsvpirWS_0tom8G9dxYPxY';

    final latitude = position.latitude;
    final longitude = position.longitude;
    final radius = '10000';
    final url = Uri.parse(
        '$baseUrl?location=$latitude,$longitude&radius=$radius&type=cafe&key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String jsonData = response.body;
      Map<String, dynamic> cafeData = json.decode(jsonData);

      List<dynamic> results = cafeData['results'];

      for (var result in results) {
        coffeeShops.add(CafePlaceIdModel.fromJson(result));
      }

      for (var shop in coffeeShops) {
        cafePlaceIds.add(shop.placeId);
      }
    }
    return cafePlaceIds;
  }

  static void getCafeData(String placeId, Set<NMarker> markerSets) async {
    final iconImage = NOverlayImage.fromAssetImage("assets/coffeeIcon.png");

    final apiKey = 'AIzaSyDuffSA5RQdjpsvpirWS_0tom8G9dxYPxY';

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String jsonData = response.body;
      Map<String, dynamic> cafeData = json.decode(jsonData);
      Map<String, dynamic> results = cafeData['result'];
      CafeDataModel cafeDataModel = CafeDataModel.fromJson(results);

      final marker = NMarker(
        caption: NOverlayCaption(text: placeId),
        id: placeId,
        position: NLatLng(cafeDataModel.geometry.location['lat'],
            cafeDataModel.geometry.location['lng']),
        icon: iconImage,

        isIconPerspectiveEnabled: true,
        alpha: 1,
        isHideCollidedMarkers: true,
        isForceShowIcon: true,
        iconTintColor: NLocationOverlay.defaultCircleColor,
        size: NSize(30.0, 50.0),
        // size: NLocationOverlay.autoSize
      );
      markerSets.add(marker);
    }
  }
}

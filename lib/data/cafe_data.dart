import 'package:flutter_naver_map/flutter_naver_map.dart';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'models/cafe_name_model.dart';

class CafeDataApi {
  static final baseUrl =
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
  static final apiKey = 'AIzaSyDuffSA5RQdjpsvpirWS_0tom8G9dxYPxY';

  static Future<List<String>> getCafePlaceId(Position position) async {
    List<CafePlaceIdModel> coffeeShops = [];
    List<dynamic> results = [];
    List<String> cafePlaceIds = [];
    final latitude = position.latitude;
    final longitude = position.longitude;
    final radius = '1000';
    final url = Uri.parse(
        '$baseUrl?location=$latitude,$longitude&radius=$radius&type=cafe|keword=cafe&opennow=true&key=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      String jsonData = response.body;
      Map<String, dynamic> cafeData = json.decode(jsonData);
      results = cafeData['results'];
      var pageToken = cafeData['next_page_token'];
      print(pageToken);
      for (int i = 0; i < 3 && pageToken != null; i++) {
        await Future.delayed(Duration(seconds: 2));
        final url = Uri.parse(
          '$baseUrl?key=$apiKey&pagetoken=$pageToken',
        );
        final response = await http.get(url);

        if (response.statusCode == 200) {
          String jsonData = response.body;
          Map<String, dynamic> cafeData = json.decode(jsonData);
          final resultso = cafeData['results'];
          pageToken = cafeData['next_page_token'];
          print("nextPageToken : $pageToken");
          results.addAll(resultso);
        }
      }

      for (var result in results) {
        coffeeShops.add(CafePlaceIdModel.fromJson(result));
      }
      for (var coffeShop in coffeeShops) {
        cafePlaceIds.add(coffeShop.placeId);
      }
    }
    print(cafePlaceIds.length);
    return cafePlaceIds;
  }

  NOverlayImage? flutterIcon;

  static void getCafeData(String placeId, Set<NMarker> markerSets,
      String currentTime, String weekDay) async {
    // final iconImage = await NOverlayImage.fromAssetImage("assets/icon.png");

    final apiKey = 'AIzaSyDuffSA5RQdjpsvpirWS_0tom8G9dxYPxY';

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String jsonData = response.body;
      Map<String, dynamic> cafeData = json.decode(jsonData);
      Map<String, dynamic> results = cafeData['result'];
      CafeDataModel cafeDataModel = CafeDataModel.fromJson(results);

      final openNow = cafeDataModel.openingHours?.openNow;
      final schedules = cafeDataModel.openingHours?.weekdayOperatingTime;

      String todaySchedule = schedules
          .where((element) => element.toString().contains(weekDay))
          .join(', ');

      print(todaySchedule);
      List<String> scheduleParts = todaySchedule.split(": ");
      print(scheduleParts);

      String operatingHour = scheduleParts[1]
          .replaceAll(" ", "")
          .replaceAll("–", "-")
          .replaceAll(" ", "")
          .replaceAll('\u202F', '')
          .replaceAll('\u2009', '');

      print(operatingHour);

      // Map<String, String> scheduleMap = {weekfDay: operatingHour};
      // print(scheduleMap.values);
      // final time = scheduleMap.values;

      List<String> timeParts = operatingHour.split("-");
      print(timeParts);
      String startTimeString = timeParts.first;
      String endTimeString = timeParts.last;

      print(startTimeString);
      print(endTimeString);

      int iconColor;
      if (openNow == null) {
        iconColor = 0;
      } else if (openNow == true) {
        iconColor = 4;
      } else {
        iconColor = 1;
      }

      final marker = NMarker(
        caption: NOverlayCaption(text: cafeDataModel.name),
        id: cafeDataModel.name,
        position: NLatLng(cafeDataModel.geometry.location['lat'],
            cafeDataModel.geometry.location['lng']),
        icon: NOverlayImage.fromAssetImage(
            "assets/icons/coffeeIcon$iconColor.png"),
        alpha: 1,
        //iconTintColor: openNow != null ? Colors.black : Colors.blue,
        size: NSize(50.0, 50.0),
      );
      markerSets.add(marker);
    }
  }
}

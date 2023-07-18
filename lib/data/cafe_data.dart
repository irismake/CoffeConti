import 'package:coffeeconti/tabs/map_tab/map.dart';
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
    return cafePlaceIds;
  }

  static void getCafeData(String placeId, Set<NMarker> markerSets) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey');
    final response = await http.get(url);
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('EEEE');
    String weekDay = formatter.format(now);

    if (response.statusCode == 200) {
      String jsonData = response.body;
      Map<String, dynamic> cafeData = json.decode(jsonData);
      Map<String, dynamic> results = cafeData['result'];
      CafeDataModel cafeDataModel = CafeDataModel.fromJson(results);
      int remainHours;
      int remainMinutes;
      int iconColor;

      final schedules = cafeDataModel.openingHours?.weekdayOperatingTime;
      String todaySchedule = schedules
          .where((element) => element.toString().contains(weekDay))
          .join(', ');

      List<String> seperateSchedule = todaySchedule.split(": ");
      String operatingHour =
          seperateSchedule[1].replaceAll(RegExp(r'[\u202F\u2009]'), '');

      List<String> seperateOpenClose = operatingHour.split("–");
      String openTimeString = seperateOpenClose.first;
      String closeTimeString = seperateOpenClose.last;

      try {
        DateFormat format = DateFormat('hh:mma');
        DateTime openDateTime = format.parse(openTimeString);
        DateTime closeDateTime = format.parse(closeTimeString);

        DateTime openHour = DateTime(
            now.year,
            now.month,
            now.day,
            openDateTime.hour,
            openDateTime.minute,
            openDateTime.second,
            openDateTime.millisecond,
            openDateTime.microsecond);
        DateTime closeHour = DateTime(
            now.year,
            now.month,
            now.day,
            closeDateTime.hour,
            closeDateTime.minute,
            closeDateTime.second,
            closeDateTime.millisecond,
            closeDateTime.microsecond);

        if (closeDateTime.hour <= 12 && closeDateTime.hour >= 0) {
          closeHour = closeHour.add(Duration(days: 1));
        }

        Duration difference = closeHour.difference(now);
        remainHours = difference.inHours;
        remainMinutes = difference.inMinutes.remainder(60);

        print("남은시간: $remainHours시간 $remainMinutes분");
        if (remainHours == 0) {
          iconColor = 2;
        } else if (remainHours == 1) {
          iconColor = 3;
        } else {
          iconColor = 4;
        }
      } catch (e) {
        iconColor = 0;
        print("잘못된 형식의 문자열입니다.");
      }

      final marker = NMarker(
        caption: NOverlayCaption(text: cafeDataModel.name),
        id: cafeDataModel.name,
        position: NLatLng(cafeDataModel.geometry.location['lat'],
            cafeDataModel.geometry.location['lng']),
        icon: NOverlayImage.fromAssetImage(
            "assets/icons/coffeeIcon$iconColor.png"),
        alpha: 1,
        size: NSize(50.0, 50.0),
      );
      markerSets.add(marker);
    }
  }

  static NMarker getMarkerData(String id, NLatLng cafePosition) {
    print("ID : $id");
    print("clickCafePosition $cafePosition");

    return NMarker(
      id: id,
      position: cafePosition,
    );
  }
}

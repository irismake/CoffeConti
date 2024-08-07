import 'package:coffeeconti/screen/map/map.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'models/cafe_name_model.dart';

class CafeDataApi {
  static final baseUrl =
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
  static final googlePlaceApi = 'AIzaSyDuffSA5RQdjpsvpirWS_0tom8G9dxYPxY';
  static final naverMapSecretKey = 'lDMeTjSLw1DzoRG2630dGJmnEIk5PxMaX7HWC3Mb';
  static final naverMapApi = 'mdla0gzhf3';

  static Future<List<String>> getCafePlaceId(Position position) async {
    List<CafePlaceIdModel> coffeeShops = [];
    List<dynamic> results = [];
    List<String> cafePlaceIds = [];
    final latitude = position.latitude;
    final longitude = position.longitude;

    final radius = '1000';
    final url = Uri.parse(
        '$baseUrl?location=$latitude,$longitude&radius=$radius&type=cafe|keword=cafe&opennow=true&key=$googlePlaceApi');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      String jsonData = response.body;
      Map<String, dynamic> cafeData = json.decode(jsonData);
      results = cafeData['results'];
      var pageToken = cafeData['next_page_token'];

      for (int i = 0; i < 3 && pageToken != null; i++) {
        await Future.delayed(Duration(seconds: 2));
        final url = Uri.parse(
          '$baseUrl?key=$googlePlaceApi&pagetoken=$pageToken',
        );
        final response = await http.get(url);

        if (response.statusCode == 200) {
          String jsonData = response.body;
          Map<String, dynamic> cafeData = json.decode(jsonData);
          final resultso = cafeData['results'];
          pageToken = cafeData['next_page_token'];
          print(pageToken);
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
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$googlePlaceApi');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String jsonData = response.body;
      Map<String, dynamic> cafeData = json.decode(jsonData);
      Map<String, dynamic> results = cafeData['result'];
      CafeDataModel cafeDataModel = CafeDataModel.fromJson(results);
      final schedules = cafeDataModel.openingHours?.weekdayOperatingTime;
      final remainTime = calculateRemainTime(schedules);

      String cafeId = toPassCafeId(cafeDataModel.name, remainTime);
      int iconColor = setMarkerColor(remainTime);

      final marker = NMarker(
        id: cafeId,
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

  static Duration calculateRemainTime(dynamic schedules) {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('EEEE');
    String weekDay = formatter.format(now);

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

      // DateTime openHour = DateTime(
      //     now.year,
      //     now.month,
      //     now.day,
      //     openDateTime.hour,
      //     openDateTime.minute,
      //     openDateTime.second,
      //     openDateTime.millisecond,
      //     openDateTime.microsecond);
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
      Duration timeDifference = closeHour.difference(now);
      print(timeDifference);
      return timeDifference;
    } catch (e) {
      print("잘못된 형식의 문자열입니다.");
      return Duration(hours: 0, minutes: 0, seconds: 0);
    }
  }

  static int setMarkerColor(Duration timeDifference) {
    int remainHours = timeDifference.inHours;
    int remainMinutes = timeDifference.inMinutes.remainder(60);

    switch (remainHours) {
      case 0:
        return (remainMinutes != 0) ? 2 : 0;
      case 1:
        return 3;
      default:
        return (remainHours >= 2) ? 4 : 0;
    }
    //   if (remainHours == 0 && remainMinutes != 0) {
    //     iconColor = 2;
    //   } else if (remainHours == 1) {
    //     iconColor = 3;
    //   } else if (remainHours >= 2) {
    //     iconColor = 4;
    //   } else {
    //     iconColor = 0;
    //   }
    //   return iconColor;
    // }
  }

  static String toPassCafeId(String cafeName, Duration timeDifference) {
    String markerId = '$cafeName-$timeDifference';
    return markerId;
  }

  static Future<List<dynamic>> getRoute(
      dynamic startPosition, dynamic goalPosition) async {
    List<dynamic> cafeRoute = [];
    final _startPositionLat = startPosition.latitude;
    final _startPositionLong = startPosition.longitude;
    final _goalPositionLat = goalPosition.latitude;
    final _goalPositionLong = goalPosition.longitude;
    print(
        "$_startPositionLat , $_startPositionLong, $_goalPositionLat,$_goalPositionLong");
    try {
      final response = await http.get(
          Uri.parse(
            'https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?start=$_startPositionLong,$_startPositionLat&goal=$_goalPositionLong,$_goalPositionLat&option=trafast',
          ),
          headers: {
            'X-NCP-APIGW-API-KEY-ID': naverMapApi,
            'X-NCP-APIGW-API-KEY': naverMapSecretKey,
          });

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonDataMap = json.decode(response.body);
        print(jsonDataMap);
        cafeRoute = jsonDataMap['route']['trafast'][0]['path'];
        print(cafeRoute);

        // List<LatLng> pathLatLngs =
        //     pathCoordinates.map((coord) => LatLng(coord[1], coord[0])).toList();

        // // Printing the result
        // pathLatLngs.forEach((latLng) {
        //   print('LatLng(${latLng.latitude}, ${latLng.longitude})');
        // });
        // final decoded = json.decode(response.body);
        // final routePoints = decoded['route']['traoptimal'];
        // final a = CafeRoute.fromJson(routePoints);
        // print(a);
        // final pathCoords =
        //     routePoints.map((point) => LatLng(point['y'], point['x'])).toList();
      } else {
        print('Failed to fetch route data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error showing route: $e');
    }
    return cafeRoute;
  }
}

import 'package:coffeeconti/data/models/place_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

import '../api_service.dart';

class PlaceListProvider with ChangeNotifier {
  final List<PlaceDetailData> _placeDetailData = [];
  LatLng _mapCenterPosition = LatLng(0.0, 0.0);
  List<LatLng> _bounds = [];
  Set<Marker> _markerSet = {};
  List<Marker> _markerList = [];

  bool _isInitialized = false;

  List<PlaceDetailData> get placeDetailData => _placeDetailData;
  List<LatLng> get bounds => _bounds;
  Set<Marker> get markerSet => _markerSet;
  List<Marker> get markerList => _markerList;

  Future<void> initializePlaceDetailData() async {
    if (!_isInitialized) {
      await fetchPlaceDetailData();
      _isInitialized = true;
      print('검색 장소 리스트 초기화');
    }
  }

  set setCenterPosition(LatLng mapCenterPosition) {
    _mapCenterPosition = mapCenterPosition;
  }

  set addMarker(Marker marker) {
    markerSet.add(marker);
  }

  Future<void> fetchPlaceDetailData() async {
    final results = await ApiService.getCategoryPlaceList(
        _mapCenterPosition.latitude, _mapCenterPosition.longitude, 2000, 'CE7');

    _placeDetailData.clear();
    for (var result in results) {
      _placeDetailData.add(result);
    }
    addMarkersToSet();
  }

  Future<void> addMarkersToSet() async {
    _bounds.clear();
    _markerList.clear();
    for (var item in placeDetailData.toList()) {
      LatLng latLng = LatLng(item.latitude, item.longitude);

      _bounds.add(latLng);

      Marker marker = Marker(
        markerId: item.id,
        latLng: latLng,
        width: 20,
        height: 20,
        offsetX: 0,
        offsetY: 0,
        markerImageSrc:
            'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png',
      );
      _markerSet.add(marker);
    }
    _markerList.addAll(_markerSet);
    notifyListeners();
  }
}

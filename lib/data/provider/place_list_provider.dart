import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

import '../api_service.dart';
import '../models/place_detail_model.dart';

enum PlaceListStatus { initial, loading, loaded, empty, error }

class PlaceListProvider with ChangeNotifier {
  PlaceListStatus _status = PlaceListStatus.initial;
  final List<PlaceDetailData> _placeDetailData = [];
  LatLng _mapCenterPosition = LatLng(0.0, 0.0);
  final List<LatLng> _bounds = [];
  final Set<Marker> _markerSet = {};
  final List<Marker> _markerList = [];

  PlaceListStatus get status => _status;
  List<PlaceDetailData> get placeDetailData =>
      List.unmodifiable(_placeDetailData);
  List<LatLng> get bounds => List.unmodifiable(_bounds);
  Set<Marker> get markerSet => Set.unmodifiable(_markerSet);
  List<Marker> get markerList => List.unmodifiable(_markerList);

  set setCenterPosition(LatLng mapCenterPosition) {
    _mapCenterPosition = mapCenterPosition;
  }

  set addMarker(Marker marker) {
    _markerSet.add(marker);
  }

  Future<void> fetchPlaceDetailData(BuildContext context) async {
    _status = PlaceListStatus.loading;
    notifyListeners();

    try {
      final results = await ApiService.getCategoryPlaceList(
          _mapCenterPosition.latitude,
          _mapCenterPosition.longitude,
          1000,
          'CE7');

      if (results.isEmpty) {
        _status = PlaceListStatus.empty;
      } else {
        _placeDetailData
          ..clear()
          ..addAll(results);
        await _updateMarkers();
        _status = PlaceListStatus.loaded;
      }
    } catch (e) {
      _status = PlaceListStatus.error;
    }

    notifyListeners();
  }

  Future<void> _updateMarkers() async {
    _bounds.clear();
    _markerList.clear();
    for (var item in _placeDetailData) {
      LatLng latLng = LatLng(item.latitude, item.longitude);
      _bounds.add(latLng);

      Marker marker = Marker(
        markerId: item.id,
        latLng: latLng,
        width: 30,
        height: 30,
        offsetX: 13,
        offsetY: 30,
        markerImageSrc:
            'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png',
      );
      _markerSet.add(marker);
    }
    _markerList.addAll(_markerSet);
  }
}

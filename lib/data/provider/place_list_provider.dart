import 'package:coffeeconti/data/models/place_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

import '../api_service.dart';

class PlaceListProvider with ChangeNotifier {
  final List<PlaceDetailData> _placeDetailData = [];
  LatLng _mapCenterPosition = LatLng(0.0, 0.0);

  bool _isInitialized = false;

  List<PlaceDetailData> get placeDetailData => _placeDetailData;

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

  Future<void> fetchPlaceDetailData() async {
    final results = await ApiService.getCategoryPlaceList(
        _mapCenterPosition.latitude, _mapCenterPosition.longitude, 2000, 'CE7');

    _placeDetailData.clear();
    for (var result in results) {
      _placeDetailData.add(result);
    }
    notifyListeners();
  }

  // Future<void> initializeMyGroupListsData() async {
  //   await fetchMyGroupBookmarkLists();
  // }

  // set selectedIndex(int? index) {
  //   _selectedIndex = index;
  //   _selectedGroupId = _myGroups[index!].id;
  //   notifyListeners();
  // }

  // set bookmarkGroupId(int? index) {
  //   _bookmarkGroupId = index;
  //   notifyListeners();
  // }

  // int? getSelectedGroupId() {
  //   print('_selectedGroupId : $_selectedGroupId');
  //   return _selectedGroupId;
  // }

  // Future<void> fetchMyGroups() async {
  //   final results = await ApiService.getMyGroups(false);
  //   List<MyGroupData> myGroups = results.groups;
  //   _myGroups.clear();
  //   for (var result in myGroups) {
  //     _myGroups.add(result);
  //   }
  //   notifyListeners();
  // }

  // Future<void> fetchMyGroupBookmarkLists() async {
  //   final results = await ApiService.getMyGroupLists(_bookmarkGroupId ?? 0);
  //   _myGroupLists.clear();
  //   for (var result in results) {
  //     if (result.isBookmarked) {
  //       _myGroupLists.add(result);
  //     }
  //   }
  //   notifyListeners();
  // }
}

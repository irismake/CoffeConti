import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';

import '../../data/cafe_data.dart';

class CafeMap extends StatefulWidget {
  const CafeMap({super.key});

  @override
  State<CafeMap> createState() => _CafeMapState();
}

class _CafeMapState extends State<CafeMap> {
  late NaverMapController mapController;

  // NaverMapViewOptions options = const NaverMapViewOptions();
  Position? currentPosition;
  List<NMarker> markers = [];
  Set<NMarker> markerSet = {};

  Future<List<NMarker>> findMarkers() async {
    var position = await _goToCurrentPosition();

    List<dynamic> cafePlaceIds = await CafeDataApi.getCafePlaceId(position);

    for (var cafePlaceId in cafePlaceIds) {
      CafeDataApi.getCafeData(cafePlaceId, markers);
    }
    while (markers.length != cafePlaceIds.length) {
      await Future.delayed(Duration(milliseconds: 1));
    }
    return markers;
  }

  Set<NMarker> createMarkerSet(List<NMarker> markers) {
    for (NMarker marker in markers) {
      markerSet.add(marker);
    }
    print("setMarkers : $markerSet");

    return markerSet;
  }

  Future<Position> _goToCurrentPosition() async {
    LocationPermission permission = await Geolocator.requestPermission();
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    currentPosition = position;

    print("goToCurrentPosition $currentPosition");

    return position;
  }

  @override
  void initState() {
    print('initstate');
    super.initState();
    findMarkers().then((getMarkers) {
      setState(() {
        markers = getMarkers;
        // print(markers);
        createMarkerSet(markers);
      });
    }).onError((error, stacktrace) => null);
    print('onMapReady');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: NaverMap(
        options: const NaverMapViewOptions(
            // indoorEnable: true,
            locationButtonEnable: true),
        // consumeSymbolTapEvents: false),
        onMapReady: onMapReady,

        // onMapTapped: onMapTapped,
        // onSymbolTapped: onSymbolTapped,
        // onCameraChange: onCameraChange,
        // onCameraIdle: onCameraIdle,
        // onSelectedIndoorChanged: onSelectedIndoorChanged,
      ),
    );
  }

  void onMapReady(NaverMapController mapController) async {
    await findMarkers();
    createMarkerSet(markers);

    print('onMapReady');
    // List<NMarker> markers = [
    //   NMarker(id: 'test', position: NLatLng(37.612941, 127.039381)),
    //   NMarker(
    //       id: 'test1',
    //       position: NLatLng(37.606932467450326, 127.05578661133796)),
    // ];

    print("dldld $markerSet");
    mapController.addOverlayAll(markerSet);
  }
  // NMarker(
  //     id: 'test1',
  //     position: const NLatLng(37.606932467450326, 127.05578661133796))

  //mapController.addOverlay(markers);
}

void onMapTapped(NPoint point, NLatLng latLng) {
  // ...
}

void onSymbolTapped(NSymbolInfo symbolInfo) {
  // ...
}

void onCameraChange(NCameraUpdateReason reason, bool isGesture) {
  // ...
}

void onCameraIdle() {
  // ...
}

void onSelectedIndoorChanged(NSelectedIndoor? selectedIndoor) {
  // ...
}

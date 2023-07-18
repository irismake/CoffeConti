import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import '../../data/cafe_data.dart';

class CafeMap extends StatefulWidget {
  const CafeMap({super.key, required this.currentPosition});
  final Position currentPosition;
  @override
  State<CafeMap> createState() => _CafeMapState();
}

class _CafeMapState extends State<CafeMap> {
  late NaverMapController mapController;

  Set<NMarker> markerSets = {};

  late final cameraPosition = NCameraPosition(
    target: NLatLng(
        widget.currentPosition.latitude, widget.currentPosition.longitude),
    zoom: 15,
    tilt: 0,
  );

  Future<Set<NMarker>> findMarkers() async {
    List<dynamic> cafePlaceIds =
        await CafeDataApi.getCafePlaceId(widget.currentPosition);
    for (var cafePlaceId in cafePlaceIds) {
      CafeDataApi.getCafeData(cafePlaceId, markerSets);
    }
    while (markerSets.length != cafePlaceIds.length) {
      await Future.delayed(Duration(milliseconds: 1));
    }
    return markerSets;
  }

  @override
  void initState() {
    print('initstate');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: NaverMap(
        options: NaverMapViewOptions(
            initialCameraPosition: cameraPosition,

            // indoorEnable: true,
            locationButtonEnable: true),
        // consumeSymbolTapEvents: false),
        onMapReady: onMapReady,
        onMapTapped: onMapTapped,
        // onMapTapped: onMapTapped,
        // onSymbolTapped: onSymbolTapped,
        //onCameraChange: onCameraChange,
        //onCameraIdle: onCameraIdle,
        // onSelectedIndoorChanged: onSelectedIndoorChanged,
      ),
    );
  }

  void onMapReady(NaverMapController mapController) async {
    print('onMapReady');
    mapController.setLocationTrackingMode(NLocationTrackingMode.follow);
    await findMarkers();

    mapController.addOverlayAll(markerSets);
    markerSets.forEach((marker) {
      marker.setOnTapListener((NMarker tappedMarker) {
        print(tappedMarker);
        print("Marker is tapped!");
        final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
          target: tappedMarker.position,
        );
        mapController.updateCamera(cameraUpdate);
      });
    });
  }

  void onMapTapped(NPoint point, NLatLng latLng) async {
    // print(CafeDataApi.clickMarker.position);
    // final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
    //   target: CafeDataApi.clickMarker.position,
    // );
    // mapController.updateCamera(cameraUpdate);
  }

  void onSymbolTapped(NSymbolInfo symbolInfo) {
    // ...
  }

  void onCameraChange(NCameraUpdateReason reason, bool isGesture) {}

  void onCameraIdle() {
    // ...
  }

  void onSelectedIndoorChanged(NSelectedIndoor? selectedIndoor) {
    // ...
  }
}

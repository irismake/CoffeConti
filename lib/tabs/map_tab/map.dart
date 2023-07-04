import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import '../../data/cafe_data.dart';
import 'package:intl/intl.dart';

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
    bearing: 45,
    tilt: 0,
  );

  Future<Set<NMarker>> findMarkers() async {
    DateTime now = DateTime.now();

    DateFormat formatter = DateFormat('EEEE');
    String currentTime = DateFormat.jm().format(now);

    String weekDay = formatter.format(now);
    List<dynamic> cafePlaceIds =
        await CafeDataApi.getCafePlaceId(widget.currentPosition);
    for (var cafePlaceId in cafePlaceIds) {
      CafeDataApi.getCafeData(cafePlaceId, markerSets, currentTime, weekDay);
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

        // onMapTapped: onMapTapped,
        // onSymbolTapped: onSymbolTapped,
        //onCameraChange: onCameraChange,
        //onCameraIdle: onCameraIdle,
        // onSelectedIndoorChanged: onSelectedIndoorChanged,
      ),
    );
  }

  void onMapReady(NaverMapController mapController) async {
    // final icon = await NOverlayImage.fromWidget(
    //     widget: const FlutterLogo(),
    //     size: const Size(24, 24),
    //     context: context);
    // final assetIcon = NOverlayImage.fromAssetImage('assets/icon.png');
    print('onMapReady');
    await findMarkers();
    // final marker = NMarker(
    //     id: "icon_test_1",
    //     position: NLatLng(
    //         widget.currentPosition.latitude, widget.currentPosition.longitude),
    //     icon: assetIcon,
    //     alpha: 1,
    //     size: NSize(30.0, 50.0));
    setState(() {
      mapController.addOverlayAll(markerSets);
    });

    //mapController.setLocationTrackingMode(NLocationTrackingMode.follow);
  }

  void onMapTapped(NPoint point, NLatLng latLng) {
    // ...
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

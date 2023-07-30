import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../data/cafe_data.dart';
import '../../../data/location_provider.dart';
import '../../../popup/ cafe_tutorial.dart';

class CafeMap extends StatefulWidget {
  const CafeMap({super.key});

  @override
  State<CafeMap> createState() => _CafeMapState();
}

class _CafeMapState extends State<CafeMap> {
  late LocationProvider _locationProvider;
  late NaverMapController mapController;
  OverlayEntry? overlayEntry;
  double bottomPadding = 10.0;
  final ValueNotifier<bool> _showCafeTutorialStateNotifier =
      ValueNotifier<bool>(false);

  Set<NMarker> markerSets = {};
  Position? _currentPosition;

  Future<Set<NMarker>> findMarkers() async {
    print('find marker function');
    List<dynamic> cafePlaceIds =
        await CafeDataApi.getCafePlaceId(_currentPosition!);
    for (var cafePlaceId in cafePlaceIds) {
      CafeDataApi.getCafeData(cafePlaceId, markerSets);
    }
    while (markerSets.length != cafePlaceIds.length) {
      await Future.delayed(Duration(milliseconds: 1));
    }
    return markerSets;
  }

  late final cameraPosition = NCameraPosition(
    target: NLatLng(
        _currentPosition?.latitude ?? 0.0, _currentPosition?.longitude ?? 0.0),
    zoom: 15,
    tilt: 0,
  );

  @override
  void initState() {
    print('initstate');
    super.initState();
    _locationProvider = Provider.of<LocationProvider>(context, listen: false);
  }

  @override
  void dispose() {
    print('dispose');
    overlayEntry?.remove();
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: ValueListenableBuilder<bool>(
        valueListenable: _showCafeTutorialStateNotifier,
        builder: (context, value, _) {
          return Stack(
            children: [
              NaverMap(
                options: NaverMapViewOptions(
                  initialCameraPosition: cameraPosition,
                ),

                onMapReady: onMapReady,
                onMapTapped: onMapTapped,

                // onSymbolTapped: onSymbolTapped,
                //onCameraChange: onCameraChange,
                //onCameraIdle: onCameraIdle,
                // onSelectedIndoorChanged: onSelectedIndoorChanged,
              ),
              Positioned(
                bottom: value ? 200.0 : 20.0,
                right: 16,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    mapController
                        .setLocationTrackingMode(NLocationTrackingMode.follow);
                  },
                  child: Icon(
                    Icons.my_location,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void onMapReady(NaverMapController controller) async {
    _currentPosition = await _locationProvider.getCurrentPosition(context);
    mapController = controller;
    print('onMapReady');
    await findMarkers();
    mapController.addOverlayAll(markerSets);
    markerSets.forEach(_setMarkerTapListener);
    mapController.setLocationTrackingMode(NLocationTrackingMode.follow);
  }

  void _setMarkerTapListener(NMarker marker) {
    marker.setOnTapListener((NMarker tappedMarker) {
      print(tappedMarker);

      if (!_showCafeTutorialStateNotifier.value) {
        _showCafeTutorial(context);
      }

      final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
        target: tappedMarker.position,
      );
      mapController.updateCamera(cameraUpdate);
    });
  }

  void onMapTapped(NPoint point, NLatLng latLng) async {
    if (_showCafeTutorialStateNotifier.value) {
      print('ontap');
      overlayEntry?.remove();
      _showCafeTutorialStateNotifier.value = false;
    }
  }

  void _showCafeTutorial(BuildContext context) {
    _showCafeTutorialStateNotifier.value = true;
    final overlay = Overlay.of(context);

    overlayEntry = OverlayEntry(
      builder: (context) {
        return CafeTutorial();
      },
    );

    overlay.insert(overlayEntry!);
  }
}

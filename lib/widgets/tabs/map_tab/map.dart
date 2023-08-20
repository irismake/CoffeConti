import 'package:coffeeconti/popup/no_cafe_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../constants/screenSize.dart';
import '../../../data/cafe_data.dart';
import '../../../data/location_provider.dart';
import '../../../popup/ cafe_tutorial.dart';

class CafeMap extends StatefulWidget {
  CafeMap({super.key});
  @override
  State<CafeMap> createState() => CafeMapState();
}

class CafeMapState extends State<CafeMap> {
  late LocationProvider _locationProvider;
  late NaverMapController mapController;
  OverlayEntry? overlayEntry;
  double bottomPadding = 10.0;
  final ValueNotifier<bool> _showCafeTutorialStateNotifier =
      ValueNotifier<bool>(false);

  Set<NMarker> markerSets = {};
  List<dynamic> remainHour = [];
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
                  scrollGesturesEnable: true,
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
                bottom: value
                    ? FocusCurrentPosition(context) //
                    : UnfocusCurrentPosition(context),
                right: 16,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    mapController
                        .setLocationTrackingMode(NLocationTrackingMode.follow);
                  },
                  child: FaIcon(
                    FontAwesomeIcons.locationCrosshairs,
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
    if (_currentPosition != null) {
      await findMarkers().then((markerSets) {
        if (markerSets.isEmpty) {
          _showNoCafeToast(context);
        }
      });
    }

    mapController.addOverlayAll(markerSets);
    print(markerSets);

    markerSets.forEach(_setMarkerTapListener);
    mapController.setLocationTrackingMode(NLocationTrackingMode.follow);
  }

  void _setMarkerTapListener(NMarker marker) {
    marker.setOnTapListener((NMarker tappedMarker) {
      if (_showCafeTutorialStateNotifier.value) {
        overlayEntry?.remove();
        //overlayEntry = null;
      }
      _showCafeTutorial(context, tappedMarker);

      final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
        target: tappedMarker.position,
      );
      mapController.updateCamera(cameraUpdate);
    });
  }

  void onMapTapped(NPoint point, NLatLng latLng) {
    print('ontap');
    overlayEntry?.remove();
    overlayEntry = null;
    _showCafeTutorialStateNotifier.value = false;
  }

  void _showCafeTutorial(BuildContext context, NMarker tappedMarker) {
    _showCafeTutorialStateNotifier.value = true;
    final overlay = Overlay.of(context);
    String cafeId = tappedMarker.info.id;
    String cafeName = cafeId.split('-')[0];
    final tappedMarkerPosition = tappedMarker.position;
    List<String> timeComponents = cafeId.split('-')[1].trim().split(':');
    String stringRemainTime = (timeComponents[0] == "0")
        ? '${timeComponents[1]}분'
        : '${timeComponents[0]}시간 ${timeComponents[1]}분';

    overlayEntry = OverlayEntry(
      builder: (context) {
        return CafeTutorial(
            cafeName: cafeName,
            stringRemainTime: stringRemainTime,
            tappedMarkerPosition: tappedMarkerPosition,
            currentPosition: _currentPosition);
      },
    );

    overlay.insert(overlayEntry!);
  }

  void _showNoCafeToast(BuildContext context) {
    final overlay = Overlay.of(context);
    // OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return NoCafeToast();
      },
    );

    overlay.insert(overlayEntry!);

    // Remove the toast after a certain duration
    // Future.delayed(Duration(seconds: 2), () {
    //   overlayEntry.remove();
    // });
  }

  Future<void> showRoute(List<dynamic> routeCoords) async {
    print("showRoute");
    List<NLatLng> convertedPath =
        routeCoords.map((coord) => NLatLng(coord[1], coord[0])).toList();

    NPathOverlay(id: "test", coords: convertedPath);

    //controller.addOverlay(pathOverlay);
  }
}

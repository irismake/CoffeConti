import 'package:coffeeconti/popup/no_cafe_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../components/button/search_place_button.dart';
import '../../../components/button/tag_button.dart';
import '../../../components/constants/screenSize.dart';
import '../../../data/cafe_data.dart';
import '../../../data/provider/keyword_provider.dart';
import '../../../data/provider/location_provider.dart';
import '../../../popup/ cafe_tutorial.dart';
import '../../../popup/set_tag.dart';

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

  void _tapCategory() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SetCategory();
        });
  }

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
      floatingActionButton: Positioned(
        bottom: UnfocusCurrentPosition(context),
        right: 16.w,
        child: Container(
          height: 50.0.h,
          width: 50.0.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {
                mapController
                    .setLocationTrackingMode(NLocationTrackingMode.follow);
              },
              child: Image.asset(
                'assets/icons/icon_my_location.png',
                height: 32.0.h,
                width: 32.0.w,
              ),
            ),
          ),
        ),
      ),
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
              Padding(
                padding: EdgeInsets.only(
                  top: ViewPaddingTopSize(context),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0.w,
                      ),
                      child: SearchPlaceButton(
                        currentAddress: '장위로 10길 10-9',
                      ),
                    ),
                    Consumer<KeywordsProvider>(
                        builder: (context, provider, child) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0.h),
                        child: SizedBox(
                          height: 40.0.h,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: provider.selectedKeywordsName.length + 1,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => TagButton(
                              name: provider.selectedCategoryId == null
                                  ? '카테고리'
                                  : index == 0
                                      ? '${provider.categoryNames[provider.selectedCategoryId!]}'
                                      : '${provider.selectedKeywordsName[index - 1]}',
                              onTap: _tapCategory,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
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
      // await findMarkers().then((markerSets) {
      //   if (markerSets.isEmpty) {
      //     _showNoCafeToast(context);
      //   }
      // });
    }

    mapController.addOverlayAll(markerSets);
    setState(() {
      print('지위기');
    });

    markerSets.forEach(_setMarkerTapListener);
    mapController.setLocationTrackingMode(NLocationTrackingMode.follow);
  }

  void _setMarkerTapListener(NMarker marker) {
    marker.setOnTapListener((NMarker tappedMarker) {
      if (_showCafeTutorialStateNotifier.value) {
        overlayEntry?.remove();
        overlayEntry = null;
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

    print('overlay marker');
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

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return NoCafeToast();
      },
    );

    overlay.insert(overlayEntry!);
  }

  Future<NPathOverlay> showRoute(List<dynamic> routeCoords) async {
    print("showRoute");
    List<NLatLng> convertedPath =
        routeCoords.map((coord) => NLatLng(coord[1], coord[0])).toList();

    final pathOverlay = NPathOverlay(id: "test", coords: convertedPath);
    mapController.addOverlay(pathOverlay);
    return pathOverlay;
  }
}

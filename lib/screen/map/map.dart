import 'package:coffeeconti/components/popup/no_cafe_toast.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../components/button/search_place_button.dart';
import '../../components/constants/screenSize.dart';
import '../../data/cafe_data.dart';
import '../../data/provider/location_provider.dart';
import '../../components/popup/cafe_tutorial.dart';
import '../../components/popup/show_category_sheet.dart';
import '../../components/widgets/search_keyword_widget.dart';

class CafeMap extends StatefulWidget {
  CafeMap({super.key});
  @override
  State<CafeMap> createState() => CafeMapState();
}

class CafeMapState extends State<CafeMap> {
  late LocationProvider _locationProvider;
  // late NaverMapController mapController;
  OverlayEntry? overlayEntry;
  double bottomPadding = 10.0;
  final ValueNotifier<bool> _showCafeTutorialStateNotifier =
      ValueNotifier<bool>(false);

  // Set<NMarker> markerSets = {};
  List<dynamic> remainHour = [];
  Position? _currentPosition;

  // Future<Set<NMarker>> findMarkers() async {
  //   print('find marker function');
  //   List<dynamic> cafePlaceIds =
  //       await CafeDataApi.getCafePlaceId(_currentPosition!);
  //   for (var cafePlaceId in cafePlaceIds) {
  //     CafeDataApi.getCafeData(cafePlaceId, markerSets);
  //   }
  //   while (markerSets.length != cafePlaceIds.length) {
  //     await Future.delayed(Duration(milliseconds: 1));
  //   }
  //   return markerSets;
  // }

  // late final cameraPosition = NCameraPosition(
  //   target: NLatLng(
  //       _currentPosition?.latitude ?? 0.0, _currentPosition?.longitude ?? 0.0),
  //   zoom: 15,
  //   tilt: 0,
  // );

  void _tapCategory(int index) {
    if (index == 0) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return ShowCategorySheet();
          });
    }
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

    //mapController.dispose();
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
              // NaverMap(
              //   options: NaverMapViewOptions(
              //     scrollGesturesEnable: true,
              //     initialCameraPosition: cameraPosition,
              //   ),

              //   onMapReady: onMapReady,
              //   onMapTapped: onMapTapped,

              //   // onSymbolTapped: onSymbolTapped,
              //   //onCameraChange: onCameraChange,
              //   //onCameraIdle: onCameraIdle,
              //   // onSelectedIndoorChanged: onSelectedIndoorChanged,
              // ),
              Padding(
                padding: EdgeInsets.only(
                  top: ViewPaddingTopSize(context),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                      child: SearchPlaceButton(
                        currentAddress: '장위로 10길 10-9',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.0),
                      child: SearchKeywordWidget(),
                    ),
                  ],
                ),
              ),
              Positioned(
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
                        // mapController.setLocationTrackingMode(
                        //     NLocationTrackingMode.follow);
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
            ],
          );
        },
      ),
    );
  }

  // void onMapReady(NaverMapController controller) async {
  //   _currentPosition = await _locationProvider.getCurrentPosition(context);
  //   mapController = controller;
  //   print('onMapReady');
  //   if (_currentPosition != null) {
  //     // await findMarkers().then((markerSets) {
  //     //   if (markerSets.isEmpty) {
  //     //     _showNoCafeToast(context);
  //     //   }
  //     // });
  //   }

  //   mapController.addOverlayAll(markerSets);
  //   setState(() {
  //     print('지위기');
  //   });

  //   markerSets.forEach(_setMarkerTapListener);
  //   mapController.setLocationTrackingMode(NLocationTrackingMode.follow);
  // }

  // void _setMarkerTapListener(NMarker marker) {
  //   marker.setOnTapListener((NMarker tappedMarker) {
  //     if (_showCafeTutorialStateNotifier.value) {
  //       overlayEntry?.remove();
  //       overlayEntry = null;
  //     }
  //     _showCafeTutorial(context, tappedMarker);

  //     final cameraUpdate = NCameraUpdate.scrollAndZoomTo(
  //       target: tappedMarker.position,
  //     );

  //     mapController.updateCamera(cameraUpdate);
  //   });
  // }

  // void onMapTapped(NPoint point, NLatLng latLng) {
  //   print('ontap');
  //   overlayEntry?.remove();
  //   overlayEntry = null;
  //   _showCafeTutorialStateNotifier.value = false;
  // }

  // void _showCafeTutorial(BuildContext context, NMarker tappedMarker) {
  //   _showCafeTutorialStateNotifier.value = true;
  //   final overlay = Overlay.of(context);
  //   String cafeId = tappedMarker.info.id;
  //   String cafeName = cafeId.split('-')[0];
  //   final tappedMarkerPosition = tappedMarker.position;
  //   List<String> timeComponents = cafeId.split('-')[1].trim().split(':');
  //   String stringRemainTime = (timeComponents[0] == "0")
  //       ? '${timeComponents[1]}분'
  //       : '${timeComponents[0]}시간 ${timeComponents[1]}분';

  //   print('overlay marker');
  //   overlayEntry = OverlayEntry(
  //     builder: (context) {
  //       return Padding(
  //         padding: EdgeInsets.symmetric(vertical: 10.0.h),
  //         child: Container(
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(6.0),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.grey.withOpacity(0.2),
  //                 spreadRadius: 1,
  //                 blurRadius: 1.0,
  //                 offset: Offset(0, 0),
  //               ),
  //             ],
  //           ),
  //           child: CafeTutorial(
  //             index: 0,
  //             name: cafeName,
  //           ),
  //         ),
  //       );
  //     },
  //   );

  //   overlay.insert(overlayEntry!);
  // }

  void _showNoCafeToast(BuildContext context) {
    final overlay = Overlay.of(context);

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return NoCafeToast();
      },
    );

    overlay.insert(overlayEntry!);
  }

  // Future<NPathOverlay> showRoute(List<dynamic> routeCoords) async {
  //   print("showRoute");
  //   List<NLatLng> convertedPath =
  //       routeCoords.map((coord) => NLatLng(coord[1], coord[0])).toList();

  //   final pathOverlay = NPathOverlay(id: "test", coords: convertedPath);
  //   mapController.addOverlay(pathOverlay);
  //   return pathOverlay;
  // }
}

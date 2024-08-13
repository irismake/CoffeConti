import 'dart:convert';
import 'package:coffeeconti/components/popup/no_cafe_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:provider/provider.dart';

import '../../components/button/search_place_button.dart';
import '../../components/constants/screenSize.dart';
import '../../data/provider/location_provider.dart';
import '../../components/widgets/search_keyword_widget.dart';
import '../../data/provider/place_list_provider.dart';

class MainMap extends StatefulWidget {
  MainMap({super.key});
  @override
  State<MainMap> createState() => MainMapState();
}

class MainMapState extends State<MainMap> {
  late KakaoMapController mapController;
  LatLng? _currentPosition;
  //Set<Marker> markers = {};

  double bottomPadding = 10.0;

  Future<void> addMarkersToSet() async {
    // List<PlaceDetailData> placeDetailDatas =
    //     Provider.of<PlaceListProvider>(context, listen: false).placeDetailData;
    // List<LatLng> bounds = [];
    // List<Marker> markerss = [];

    // for (var item in placeDetailDatas.toList()) {
    //   LatLng latLng = LatLng(item.latitude, item.longitude);

    //   bounds.add(latLng);

    //   Marker marker = Marker(
    //     markerId: item.id,
    //     latLng: latLng,
    //     width: 50,
    //     height: 45,
    //     offsetX: 10,
    //     offsetY: 43,
    //     markerImageSrc: await assetToBase64('assets/icons/coffeeIcon4.png'),
    //     zIndex: 3,
    //   );

    //   markerss.add(marker);

    //   print(latLng);
    // }

    setState(() {});
  }

  Future<String> assetToBase64(String path) async {
    final ByteData bytes = await rootBundle.load(path);
    final buffer = bytes.buffer;
    return 'data:image/png;base64,' + base64.encode(Uint8List.view(buffer));
  }

  @override
  void initState() {
    print('initstate');
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LocationProvider>(context, listen: false)
          .getInitialPosition(context);
    });
  }

  @override
  void dispose() {
    print('dispose');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<LocationProvider, PlaceListProvider>(
      builder: (context, locationProvider, placeListProvider, child) {
        if (locationProvider.initialPosition == null) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          _currentPosition = locationProvider.initialPosition!;
          Set<Marker> markers = placeListProvider.markerSet;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (placeListProvider.bounds.isNotEmpty) {
              print('ggg');
              mapController.fitBounds(placeListProvider.bounds);
            }
          });
          return Scaffold(
            body: Stack(
              children: [
                KakaoMap(
                  center: _currentPosition,
                  currentLevel: 5,
                  onMapCreated: ((controller) async {
                    await Future.delayed(const Duration(milliseconds: 150), () {
                      controller.setCenter(_currentPosition!);
                    });
                    mapController = controller;

                    LatLng centerPosition = await controller.getCenter();

                    placeListProvider.setCenterPosition = centerPosition;

                    placeListProvider.addMarker = Marker(
                      infoWindowFirstShow: false,
                      markerId: 'centerMarker',
                      latLng: await mapController.getCenter(),
                      width: 40,
                      height: 40,
                      offsetX: 10,
                      offsetY: 50,
                      markerImageSrc: await assetToBase64(
                          'assets/icons/icon_current_location.png'),
                    );

                    setState(() {});
                  }),
                  markers: markers.toList(),
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
                          offset: Offset(0, 0),
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
                          mapController.panTo(_currentPosition!);
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
            ),
          );
        }
      },
    );
  }

  NoCafeToast _showNoCafeToast(BuildContext context) {
    return NoCafeToast();
  }
}

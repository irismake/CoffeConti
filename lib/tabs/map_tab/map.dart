import 'package:coffeeconti/data/cafe_data.dart';
import 'package:coffeeconti/tabs/map_tab/search_tab.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:geolocator/geolocator.dart';

class CafeMap extends StatefulWidget {
  const CafeMap({super.key});

  @override
  State<CafeMap> createState() => _CafeMapState();
}

class _CafeMapState extends State<CafeMap> {
  NaverMapController? _controller;
  Position? currentPosition;
  List<Marker> markers = [];

  Future<List<Marker>> findMarkers() async {
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

  @override
  void onMapCreated(NaverMapController controller) {
    _controller = controller;
    requestLocationPermission();
  }

  void requestLocationPermission() async {
    _controller!.setLocationTrackingMode(LocationTrackingMode.Follow);
  }

  @override
  void initState() {
    print('initstate');
    super.initState();

    findMarkers().then((getMarkers) {
      setState(() {
        markers = getMarkers;
        print(markers);
      });

      //_goToCurrentPosition();
    }).onError((error, stacktrace) => null);
  }

  Future<Position> _goToCurrentPosition() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    currentPosition = position;

    LatLng currentLocation = LatLng(position.latitude, position.longitude);
    _controller?.moveCamera(
      CameraUpdate.scrollTo(currentLocation),
    );
    print("goToCurrentPosition $currentLocation");
    return position;
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  void _onPressedSearchTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchTab(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      body: Stack(
        children: [
          NaverMap(
            locationButtonEnable: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(currentPosition?.latitude ?? 37.613,
                  currentPosition?.longitude ?? 127.039352),
              zoom: 15.0,
            ),
            onMapCreated: onMapCreated,
            minZoom: 10.0,
            maxZoom: 20.0,
            markers: markers,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),

                  //minimumSize: Size(500, 20), //width, height
                  fixedSize: Size(500, 50),
                  alignment: Alignment.centerLeft,
                  textStyle: const TextStyle(
                    fontSize: 17,
                  )),
              child: Text('Search'),
              onPressed: () {
                _onPressedSearchTap();
              },
            ),
          ),
          // Positioned(
          //   bottom: 16,
          //   right: 16,
          //   child: FloatingActionButton(
          //     backgroundColor: Colors.white,
          //     onPressed: _goToCurrentPosition,
          //     child: Icon(
          //       Icons.my_location,
          //       color: Colors.teal,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

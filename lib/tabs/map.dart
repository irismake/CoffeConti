import 'dart:math';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
import '../features/main_navigation/main_navigation.dart';
import 'package:geolocator/geolocator.dart';

class CafeMap extends StatefulWidget {
  const CafeMap({super.key});

  @override
  State<CafeMap> createState() => _CafeMapState();
}

class _CafeMapState extends State<CafeMap> {
  GoogleMapController? _controller;
  // LocationData? _currentLocation;
  Position? _currentPosition;
  // double? _currentLatitude;
  // double? _currentlongitude;

  @override
  void initState() {
    super.initState();
    setState(() {
      _getPosition().then((position) {
        _currentPosition = position;
        // _currentLatitude = position.latitude;
        // _currentlongitude = position.longitude;
        print("check ${position.latitude},${position.longitude}");
      }).onError((error, stacktrace) => null);
    });
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  Future<Position> _getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print('_getPosition');
    return position;
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(_currentPosition?.latitude ?? 0.0,
              _currentPosition?.longitude ?? 0.0
              // _currentLatitude ?? 0.0,
              // _currentlongitude ?? 0.0,
              ), // Initial map location (San Francisco)
          zoom: 5.0, // Initial zoom level
        ),
      ),
    );
  }
}

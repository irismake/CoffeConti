import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../features/main_navigation/main_navigation.dart';

class CafeMap extends StatefulWidget {
  const CafeMap({super.key});

  @override
  State<CafeMap> createState() => _CafeMapState();
}

class _CafeMapState extends State<CafeMap> {
  GoogleMapController? _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target:
              LatLng(37.6143, 127.0405), // Initial map location (San Francisco)
          zoom: 12.0, // Initial zoom level
        ),
      ),
    );
  }
}

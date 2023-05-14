import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target:
              LatLng(37.6143, 127.0405), // Initial map location (San Francisco)
          zoom: 22.0, // Initial zoom level
        ),
      ),
    );
  }
}

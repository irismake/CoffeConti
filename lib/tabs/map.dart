import 'dart:math';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
import '../features/main_navigation/main_navigation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
    _focusNode.addListener(_onFocusChange);
    setState(() {
      _getPosition().then((position) {
        _currentPosition = position;
        // _currentLatitude = position.latitude;
        // _currentlongitude = position.longitude;
        print("check ${position.latitude},${position.longitude}");
      }).onError((error, stacktrace) => null);
    });
  }

  void _onFocusChange() {
    setState(() {
      _showSuggestions = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
    print('dispose');
  }

  Future<Position> _getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print('_getPosition');
    return position;
  }

  final List<String> suggestions = [
    'Apple',
    'Banana',
    'Cherry',
    'Durian',
    'Elderberry',
    'Fig',
    'Grape',
    'Honeydew',
    'Jackfruit',
    'Kiwi',
    'Lemon',
    'Mango',
    'Nectarine',
    'Orange',
    'Papaya',
    'Quince',
    'Raspberry',
    'Strawberry',
    'Tangerine',
    'Ugli fruit',
    'Watermelon',
  ];

  bool _showSuggestions = false;
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
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
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                _showSuggestions = false;
                _focusNode.unfocus();
              });
            },
            child: Container(
              //color: Colors.red,
              alignment: Alignment.topCenter,
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: TypeAheadField(
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(),
                  textFieldConfiguration: TextFieldConfiguration(
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: 'Search',
                    ),
                  ),
                  suggestionsCallback: (pattern) {
                    return getSuggestions(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    // Do something with the selected suggestion
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(suggestions);

    matches.retainWhere(
        (suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()));
    return matches.take(5).toList();
    ;
  }
}

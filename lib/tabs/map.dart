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
    LatLng currentLocation = LatLng(position.latitude, position.longitude);
    _controller?.animateCamera(
      CameraUpdate.newLatLng(currentLocation),
    );
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
            myLocationButtonEnabled: false,
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
              zoom: 15.0, // Initial zoom level
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                _focusNode.unfocus();
              });
            },
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TypeAheadField(
                    suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                        hasScrollbar: true,
                        constraints:
                            BoxConstraints.expand(width: 355, height: 300)),
                    textFieldConfiguration: TextFieldConfiguration(
                      //style: ,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0, // Adjust the vertical padding
                          horizontal: 12.0, // Adjust the horizontal padding
                        ),
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
                    noItemsFoundBuilder: (value) {
                      var localizedMessage = "찾을 수 없습니다";
                      return Text(localizedMessage);
                    },
                  ),
                  // Container(
                  //   width: 30,
                  //   height: 200,
                  //   color: Colors.deepOrange,
                  // )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: _getPosition,
              child: Icon(Icons.my_location),
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
    return matches;
  }
}

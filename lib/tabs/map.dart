import 'package:coffeeconti/data/cafe_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
  Future<Position> _getCurrentPosition() async {
    final position = await CurrentLocationData.getCurrentPosition();

    return position;
  }

  Future<List<Marker>> findMarkers() async {
    List<dynamic> cafePlaceIds = await CafeDataApi.getCafePlaceId();
    List<Marker> markers = [];

    for (var cafePlaceId in cafePlaceIds) {
      CafeDataApi.getCafeData(cafePlaceId, markers);
    }

    while (markers.length != cafePlaceIds.length) {
      await Future.delayed(Duration(milliseconds: 10));
    }

    return markers;
  }

  @override
  void initState() {
    print('initstate');
    super.initState();

    setState(() {
      _getCurrentPosition().then((position) {
        setState(() {
          currentPosition = position;
        });
      }).onError((error, stacktrace) => null);

      findMarkers().then((getMarkers) {
        setState(() {
          markers = getMarkers;
          print(markers);
        });
      }).onError((error, stacktrace) => null);
    });
  }

  void _goToCurrentPosition() {
    LatLng currentLocation = LatLng(
        currentPosition?.latitude ?? 0.0, currentPosition?.longitude ?? 0.0);
    _controller?.moveCamera(
      CameraUpdate.scrollTo(currentLocation),
    );
    print("goToCurrentPosition $currentLocation");
  }

  void _onFocusChange() {
    setState(() {
      _showSuggestions = _focusNode.hasFocus;
    });
  }

  // List<Marker> _getMarkers() {
  //   findMarkers();
  //   return locations.map((location) {
  //     return Marker(
  //       markerId: (location['id']),
  //       position: LatLng(location['latitude'], location['longitude']),
  //     );
  //   }).toList();
  // }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
    print('dispose');
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
    _goToCurrentPosition();
    print('build');
    return Scaffold(
      body: Stack(
        children: [
          NaverMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(currentPosition?.latitude ?? 0.0,
                  currentPosition?.longitude ?? 0.0),
              zoom: 13.0,
            ),
            onMapCreated: (controller) {
              _controller = controller;
            },
            markers: markers,
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
                    suggestionsBoxVerticalOffset: 2,
                    suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                        hasScrollbar: true,
                        constraints:
                            BoxConstraints.expand(width: 355, height: 300)),
                    textFieldConfiguration: TextFieldConfiguration(
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(10),
                        ),

                        hintText: 'Search',
                        // contentPadding: EdgeInsets.symmetric(
                        //   vertical: 16.0, // Adjust the vertical padding
                        //   horizontal: 12.0, // Adjust the horizontal padding
                        // ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              style: BorderStyle
                                  .none), // Set the border color when focused
                          borderRadius: BorderRadius.circular(10),
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
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: _goToCurrentPosition,
              child: Icon(
                Icons.my_location,
                color: Colors.teal,
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
    return matches;
  }
}

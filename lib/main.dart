import 'package:coffeeconti/data/cafe_data.dart';
import 'package:coffeeconti/tabs/profile.dart';
import 'package:flutter/material.dart';

import 'features/main_navigation/main_navigation.dart';
import 'package:geolocator/geolocator.dart';
import 'constants/sizes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    CafeDataApi;
    return MaterialApp(
      title: 'Coffee Conti',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xFFE9435A),
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            ),
          )),
      home: UserProfile(),
    );
  }
}

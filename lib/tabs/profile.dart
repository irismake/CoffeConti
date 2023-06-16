import 'package:coffeeconti/data/cafe_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:coffeeconti/features/main_navigation/main_navigation.dart';

import '../data/models/cafe_name_model.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

void main() async {
  List<dynamic> cafePlaceId = await CafeDataApi.getCafePlaceId();

  print(cafePlaceId);
  CafeDataModel cafeDataModel =
      await CafeDataApi.getCafeData('ChIJ993jM5alfDURK3Yb1pmmBf8');
  print(cafeDataModel.geometry.location);
  print(cafeDataModel.openingHours.weekdayText);
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    super.initState();

    setState(() {
      main();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //bottomNavigationBar: MainNavigationScreen(),
    );
  }
}

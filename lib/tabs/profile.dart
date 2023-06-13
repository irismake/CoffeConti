import 'package:coffeeconti/data/cafe_data.dart';
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

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    super.initState();

    setState(() {
      CafeDataApi.getCafeName();
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

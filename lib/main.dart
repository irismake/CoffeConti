import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter/material.dart';
import 'constants/sizes.dart';
import 'package:provider/provider.dart';

import 'package:coffeeconti/data/location_provider.dart';

void main() async {
  await _initialize();

  runApp(const MyApp());
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
      clientId: 'mdla0gzhf3',
      onAuthFailed: (ex) => print("********* 네이버맵 인증오류 : $ex *********"));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocationProvider>(
      create: (context) => LocationProvider(), // LocationProvider 인스턴스 생성
      child: MaterialApp(
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
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // LocationProvider의 인스턴스를 가져옵니다.
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    locationProvider.requestLocationPermission(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Location permission is being requested...'),
      ),
    );
  }
}

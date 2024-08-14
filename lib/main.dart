import 'package:coffeeconti/data/provider/place_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

import 'package:provider/provider.dart';

import 'components/constants/sizes.dart';
import 'package:coffeeconti/data/provider/location_provider.dart';
import 'data/provider/keyword_provider.dart';
import 'screen/navigator/main_view_navigator.dart';

void main() async {
  //await _initialize();
  await dotenv.load(fileName: 'assets/config/.env');
  AuthRepository.initialize(
    appKey: dotenv.env['APP_KEY'] ?? '',
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<KeywordsProvider>(
          create: (context) => KeywordsProvider(),
        ),
        ChangeNotifierProvider<LocationProvider>(
          create: (context) => LocationProvider(),
        ),
        ChangeNotifierProvider<PlaceListProvider>(
          create: (context) => PlaceListProvider(),
        ),
      ],
      builder: (context, child) {
        return ScreenUtilInit(
          builder: (BuildContext context, child) => MaterialApp(
            home: MyApp(),
            debugShowCheckedModeBanner: false,
          ),
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
        );
      },
    ),
  );
}

// Future<void> _initialize() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await NaverMapSdk.instance.initialize(
//       clientId: 'mdla0gzhf3',
//       onAuthFailed: (ex) => print("********* 네이버맵 인증오류 : $ex *********"));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await Provider.of<KeywordsProvider>(context, listen: false).getAllData();
    });
    return MaterialApp(
      title: 'Coffee Conti',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xffFFBE98),
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
      home: MainViewNavigator(),
    );
  }
}

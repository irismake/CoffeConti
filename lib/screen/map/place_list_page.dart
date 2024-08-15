import 'package:coffeeconti/components/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/widgets/place_list_widget.dart';
import '../../components/widgets/search_keyword_widget.dart';

class PlaceListPage extends StatelessWidget {
  const PlaceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: '장소 리스트'),
      body: Container(
        color: Color(0xFFf5f5f5),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0.h),
              child: SearchKeywordWidget(),
            ),
            PlaceListWidget(),
          ],
        ),
      ),
    );
  }
}

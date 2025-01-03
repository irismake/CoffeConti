import 'package:coffeeconti/data/provider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../data/provider/place_list_provider.dart';
import '../button/next_page_button.dart';
import '../constants/screenSize.dart';
import '../../data/provider/keyword_provider.dart';
import '../ui/category_tab_bar.dart';
import '../widgets/select_keyword_widget.dart';

class ShowCategorySheet extends StatelessWidget {
  ShowCategorySheet({Key? key}) : super(key: key);

  final checkTextColor = Color(0xff868E96);
  final darkGrayColor = Color(0xff495057);

  @override
  Widget build(BuildContext context) {
    return Consumer3<KeywordsProvider, PlaceListProvider, LocationProvider>(
        builder: (context, keywordsProvider, placeListProvider,
            locationProvider, child) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: Colors.white,
            ),
            height: ModalBottomSheetHeight(context),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(
                left: 18.0.w,
                right: 18.0.w,
                bottom: 30.0.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: darkGrayColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 4,
                      width: 50.0.w,
                      margin: EdgeInsets.symmetric(vertical: 15.0.h),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0.h),
                      child: CategoryTabBar(
                        tabBarViewWidget: SelectKeywordWidget(),
                      ),
                    ),
                  ),
                  NextPageButton(
                    firstFieldState: true,
                    secondFieldState: keywordsProvider.searchButtonState,
                    text: '찾기',
                    onPressed: () {
                      keywordsProvider.getSelectedKeywords();
                      final int categoryId =
                          keywordsProvider.selectedCategoryId!;
                      placeListProvider.fetchPlaceDetailData(
                          context, categoryId);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

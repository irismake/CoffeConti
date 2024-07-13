import 'package:coffeeconti/data/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/button/next_page_button.dart';
import '../components/constants/screenSize.dart';
import '../data/models/keyword_model.dart';
import '../widgets/main_navigation/page_view_navigator.dart';

class SetCategory extends StatelessWidget {
  SetCategory({Key? key}) : super(key: key);

  final checkTextColor = Color(0xff868E96);
  final darkGrayColor = Color(0xff495057);

  @override
  Widget build(BuildContext context) {
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
              left: 16.0.w,
              right: 16.0.w,
              bottom: 30.0.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: darkGrayColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    height: 4,
                    width: 50.0.w,
                    margin: EdgeInsets.symmetric(vertical: 15.0.h),
                  ),
                ),
                Container(
                    height: 500,
                    child: CategoryViewNavigator(
                      tabName_0: '카페',
                      tabName_1: '음식점',
                      initialPage: 0,
                    )),
                //TagListView(),
                NextPageButton(
                  firstFieldState: true,
                  secondFieldState: true,
                  text: '찾기',
                  onPressed: () async {
                    List<KeywordData> keywords =
                        await ApiService.getKeywords(0);
                    print(keywords);

                    for (var keyword in keywords) {
                      print(
                          'Keyword ID: ${keyword.id}, Name: ${keyword.name}, IsSelected: ${keyword.isSelected}');
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class TagListView extends StatelessWidget {
  TagListView({Key? key}) : super(key: key);

  final checkTextColor = Color(0xff868E96);
  final darkGrayColor = Color(0xff495057);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        // controller: scrollController,
        slivers: [
          SliverList.list(children: const [
            ListTile(title: Text('Jane Doe')),
          ])
        ],
      ),
    );
  }
}

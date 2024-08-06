import 'package:flutter/material.dart';

import '../../components/ui/category_tab_bar.dart';
import '../../components/ui/custom_app_bar.dart';
import '../../components/widgets/my_review_list_widget.dart';

class MyReviewPage extends StatelessWidget {
  const MyReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: '내가 쓴 리뷰'),
      body: CategoryTabBar(
        tabBarViewWidget: MyReviewListWidget(),
      ),
    );
  }
}

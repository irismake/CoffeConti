import 'package:coffeeconti/components/ui/category_tab_bar.dart';
import 'package:flutter/material.dart';

import '../../components/widgets/my_bookmark_list_widget.dart';
import '../../components/ui/custom_app_bar.dart';

class MyBookmarkListPage extends StatelessWidget {
  final String groupName;
  const MyBookmarkListPage({super.key, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: groupName),
      body: CategoryTabBar(
        tabBarViewWidget: MyBookmarkListWidget(),
      ),
    );
  }
}

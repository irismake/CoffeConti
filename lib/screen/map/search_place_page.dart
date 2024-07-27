import 'package:flutter/material.dart';

import 'package:coffeeconti/components/button/associated_search_button.dart';

import '../../components/ui/custom_app_bar.dart';
import '../../components/ui/custom_search_bar.dart';

const interests = [
  'Apple',
  'Banana',
  'Cherry',
  'Durian',
  'Elderberry',
  'Fig',
  'Grape',
  'Honeydew',
  'Jackfruit',
  'Kiwi',
  'Lemon',
  'Mango',
  'Nectarine',
  'Orange',
  'Papaya',
  'Quince',
  'Raspberry',
  'Strawberry',
  'Tangerine',
  'Ugli fruit',
  'Watermelon',
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
];

class SearchPlacePage extends StatefulWidget {
  const SearchPlacePage({super.key});

  @override
  State<SearchPlacePage> createState() => _SearchPlacePageState();
}

class _SearchPlacePageState extends State<SearchPlacePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: '위치 검색'),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              width: 500,
              height: 100,
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: CustomSearchBar(
                  autoFocus: false,
                  enabled: false,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Scrollbar(
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var interest in interests)
                      AssociatedSearchButton(interest: interest)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

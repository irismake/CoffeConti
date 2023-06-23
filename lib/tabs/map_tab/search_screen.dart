import 'package:coffeeconti/features/main_navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:coffeeconti/associated_search.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

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

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      appBar: AppBar(
        title: Text('위치 검색'),
      ),
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
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '장소, 주소 검색',
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Please write your Password";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    // if (newValue != null) {
                    //   formData['password'] = newValue;
                    // }
                    // ;
                  },
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

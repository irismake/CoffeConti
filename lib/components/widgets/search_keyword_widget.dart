import 'package:coffeeconti/components/button/category_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../button/search_keyword_button.dart';
import '../../data/provider/keyword_provider.dart';

class SearchKeywordWidget extends StatelessWidget {
  const SearchKeywordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KeywordsProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          height: 34.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CategoryButton(
                index: provider.selectedCategoryId,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.selectedKeywordDatas.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SearchKeywordButton(
                    keywordId: provider.selectedKeywordDatas[index].id,
                    name: provider.selectedKeywordDatas[index].name,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

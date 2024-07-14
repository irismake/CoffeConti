import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../components/button/keyword_button.dart';
import '../data/models/keyword_model.dart';
import '../data/provider/keyword_provider.dart';

class KeywordWidget extends StatefulWidget {
  final int categoryId;
  const KeywordWidget({
    super.key,
    required this.categoryId,
  });

  @override
  State<KeywordWidget> createState() => _KeywordWidgetState();
}

class _KeywordWidgetState extends State<KeywordWidget> {
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _onScroll();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<KeywordsProvider>(
      builder: (context, provider, child) {
        provider.saveKeyword();
        provider.selectedCategory = widget.categoryId;
        print('선택한 카테고리 :${provider.categoryId}');
        KeywordModel keywordModel = provider.getKeywordsData();
        List<KeywordData> keywordLists = keywordModel.keywords;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0.h,
              horizontal: 20.0.w,
            ),
            child: Scrollbar(
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.spaceAround,
                      runSpacing: 15,
                      spacing: 10,
                      children: [
                        for (var keyword in keywordLists)
                          KeywordButton(keywordName: keyword.name)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../data/provider/keyword_provider.dart';
import '../button/select_keyword_button.dart';

class SelectKeywordWidget extends StatefulWidget {
  const SelectKeywordWidget({
    super.key,
  });

  @override
  State<SelectKeywordWidget> createState() => _SelectKeywordWidgetState();
}

class _SelectKeywordWidgetState extends State<SelectKeywordWidget> {
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
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0.h,
      ),
      child: Container(
        child: Scrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 18,
                  spacing: 10,
                  children:
                      Provider.of<KeywordsProvider>(context, listen: false)
                          .showKeywordDatas
                          .map((keywordData) {
                    return SelectKeywordButton(
                      keywordName: keywordData.name,
                      keywordId: keywordData.id,
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

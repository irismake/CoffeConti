import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/button/keyword_button.dart';
import '../data/models/keyword_model.dart';

class KeywordWidget extends StatefulWidget {
  final List<KeywordData> keywordDatas;
  const KeywordWidget({
    super.key,
    required this.keywordDatas,
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
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.0.h,
          horizontal: 20.0.w,
        ),
        child: Container(
          //color: Colors.pink,
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
                    children: [
                      for (var keywordData in widget.keywordDatas)
                        KeywordButton(keywordName: keywordData.name)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

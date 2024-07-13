import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/button/keyword_button.dart';

class KeywordWidget extends StatefulWidget {
  final List<String> keywords;
  const KeywordWidget({
    super.key,
    required this.keywords,
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
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        color: Colors.orange,
        child: Scrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 15,
                  spacing: 10,
                  children: [
                    for (var keyword in widget.keywords)
                      KeywordButton(keywordName: keyword)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

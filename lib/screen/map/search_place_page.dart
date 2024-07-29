import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/ui/custom_app_bar.dart';
import '../../components/ui/custom_search_bar.dart';
import 'package:coffeeconti/components/widgets/recent_search_widget.dart';

class SearchPlacePage extends StatefulWidget {
  const SearchPlacePage({super.key});

  @override
  State<SearchPlacePage> createState() => _SearchPlacePageState();
}

class _SearchPlacePageState extends State<SearchPlacePage> {
  final ScrollController _scrollController = ScrollController();

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {});

    _focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  void _onTap() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: '위치 검색'),
      body: Container(
        color: Color(0xffF8F9FA),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18.0.w),
              child: CustomSearchBar(
                focusNode: _focusNode, // Pass the focus node
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.0.w,
                  right: 20.0.w,
                  top: 10.0,
                  bottom: 30.0,
                ),
                child: RecentSearchWidget(
                  onTap: _onTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

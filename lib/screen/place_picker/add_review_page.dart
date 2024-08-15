import 'package:coffeeconti/components/button/next_page_button.dart';
import 'package:coffeeconti/data/provider/keyword_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../components/button/star_rating_button.dart';
import '../../components/button/search_place_button.dart';
import '../../components/ui/custom_app_bar.dart';
import '../../components/widgets/my_review_widget.dart';
import '../../components/widgets/select_keyword_widget.dart';

class AddReviewPage extends StatefulWidget {
  const AddReviewPage({super.key});

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: '리뷰 작성'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '카테고리',
                          style: TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff343A40),
                            height: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 130,
                            child: MyReviewWidget(
                              index: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '위치',
                          style: TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff343A40),
                            height: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: SearchPlaceButton(
                          currentAddress: '장위로 10길 10-9',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '이름',
                          style: TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff343A40),
                            height: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.0.w,
                                vertical: 14.0,
                              ),
                              child: Text(
                                '커피스토어',
                                style: TextStyle(
                                  fontFamily: 'PretendardRegular',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF868E96),
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '그룹 선택',
                          style: TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff343A40),
                            height: 1.5,
                          ),
                        ),
                        // Consumer<MyGroupsProvider>(
                        //   builder: (context, provider, child) {
                        //     final List<MyGroupData> myGroups = provider.myGroups;
                        //     return CustomDropdownButton(
                        //       dropDownItems: myGroups,
                        //       provider: provider,
                        //     );
                        //   },
                        // ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '키워드 선택',
                            style: TextStyle(
                              fontFamily: 'PretendardRegular',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff343A40),
                              height: 1.5,
                            ),
                          ),
                          Text(
                            ' (최대 3개)',
                            style: TextStyle(
                              fontFamily: 'PretendardRegular',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff868E96),
                              height: 1.43,
                            ),
                          ),
                        ],
                      ),
                      Consumer<KeywordsProvider>(
                        builder: (context, provider, child) {
                          provider.saveTempCategoryId = 1;
                          return SelectKeywordWidget();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '추천 메뉴 태그',
                            style: TextStyle(
                              fontFamily: 'PretendardRegular',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff343A40),
                              height: 1.5,
                            ),
                          ),
                          Text(
                            ' (선택)',
                            style: TextStyle(
                              fontFamily: 'PretendardRegular',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff868E96),
                              height: 1.43,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'ex) 파운드케이크, 닭발, 얼그레이 하이볼',
                            style: TextStyle(
                              fontFamily: 'PretendardRegular',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffADB5BD),
                              height: 1.43,
                            ),
                          ),
                        ),
                      ),
                      //  CustomDropdownButton(
                      //             dropDownItems: keywords, provider: provider),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 200.0.w,
                            height: 48.0.h,
                            child: TextFormField(
                              // controller: keywordController,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 14.0.w),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Color(0xffF5F6F7),
                                hintText: '직접입력',
                                hintStyle: TextStyle(
                                  color: Color(0xffADB5BD),
                                  fontSize: 15.0.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 1,
                                ),
                              ),
                              style: TextStyle(
                                decorationThickness: 0,
                                color: Color(0xFF212529),
                                fontSize: 15.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                              ),
                              onFieldSubmitted: (String value) {
                                // _keywordIndex++;
                                // KeywordData keywordData =
                                //     KeywordData(name: value, id: _keywordIndex);
                                // KeywordsProvider provider =
                                //     Provider.of<KeywordsProvider>(context,
                                //         listen: false);
                                // provider.addKeyword(keywordData);
                                // keywordController.clear();
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '별점',
                          style: TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff343A40),
                            height: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: StarRatingButton(
                          onRatingSelected: (int rating) {
                            print("Selected rating: $rating");
                            // 여기서 선택된 별점을 처리
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0.h,
                bottom: 30.0.h,
              ),
              child: NextPageButton(
                firstFieldState: true,
                secondFieldState: false,
                text: '작성 완료',
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

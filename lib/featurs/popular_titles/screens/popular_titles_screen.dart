import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/assets_manager.dart';
import '../../../core/constants.dart';
import '../widgets/popular_titles_item_widget.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../../widgets/app_padding_widget.dart';
import '../../widgets/logo_widget.dart';

class PopularTitlesScreen extends StatelessWidget {
  const PopularTitlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: ColorsManager.shadowLoginColor,
                        blurRadius: 30.sp,
                        offset: Offset(0, 4.sp)),
                  ],
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30.r),
                  ),
                ),
                child: AppPaddingWidget(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              child: Image.asset(
                                AssetsManager.backIconIMG,
                              ),
                            ),
                          ),
                          LogoWidget(
                            width: 80.w,
                            height: 80.h,
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      Text(
                        Strings.popularTitlesText,
                        style: TextStyle(
                          fontSize: 32.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: Constants.popularTitlesList.length,
              itemBuilder: (context, index) => PopularTitlesItemWidget(
                text: Constants.popularTitlesList[index],
              ),
            )
          ],
        ),
      ),
    );
  }
}

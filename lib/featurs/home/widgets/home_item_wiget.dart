import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/core/assets_manager.dart';
import 'package:mardod/core/colors.dart';
import 'package:mardod/core/theme_manager.dart';
import 'package:mardod/featurs/popular_titles/screens/popular_titles_screen.dart';

class HomeItemWiget extends StatelessWidget {
  const HomeItemWiget({
    super.key,
    required this.name,
    required this.icon,
    this.route,
  });

  final String name;
  final String icon;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PopularTitlesScreen(),
          ),
        );
      },
      child: Container(
        constraints: BoxConstraints(minWidth: 180.w),
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        decoration: BoxDecoration(
            // image: const DecorationImage(
            //     fit: BoxFit.cover,
            //     image: AssetImage(
            //       AssetsManager.waveIMG,
            //     )),
            color: ColorsManager.homeItemColor.withOpacity(.5),
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xffC2CCEB),
                  offset: Offset(10.sp, 10.sp),
                  blurRadius: 20.sp),
              BoxShadow(
                  color: const Color(0xffEAEFFF),
                  offset: Offset(-10.sp, -10.sp),
                  blurRadius: 16.sp),
            ]),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Image.asset(
                  icon,
                  width: 30.sp,
                  height: 30.sp,
                ),
                SizedBox(
                  height: 20.h,
                ),
                FittedBox(
                  child: Text(
                    name,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            PositionedDirectional(
              bottom: 0,
              end: 0,
              child: Image.asset(
                AssetsManager.editIconIMG,
                width: 22.sp,
                height: 22.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}

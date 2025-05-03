import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/assets_manager.dart';
import '../../../core/colors.dart';
import '../../popular_titles/screens/popular_titles_screen.dart';

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({
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
        Navigator.push(context, MaterialPageRoute(builder: (_)=>PopularTitlesScreen(),),);
      },
      child: Container(
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
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
                SizedBox(height: 10.h,),
                Image.asset(
                  icon,
                  width: 50.sp,
                  height: 50.sp,
                ),
                SizedBox(height: 20.h,),
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

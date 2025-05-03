import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/colors.dart';
class DialogWithShadowWidget extends StatelessWidget {
  const DialogWithShadowWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Material(
        color: ColorsManager.transparentColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              decoration: BoxDecoration(
                  color: ColorsManager.homeItemColor.withOpacity(.9),
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsManager.whiteColor,
                      blurRadius: 30.sp,
                    )
                  ]),
              alignment: Alignment.center,
              width: double.maxFinite,
              child: Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

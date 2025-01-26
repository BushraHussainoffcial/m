import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mardod/core/assets_manager.dart';
import 'package:mardod/core/colors.dart';

class MyMessageShapeWidget extends StatelessWidget {
  const MyMessageShapeWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final sizer = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
                  constraints: BoxConstraints(maxWidth: sizer - 110.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: ColorsManager.myMessageShapeColor.withOpacity(.8),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                PositionedDirectional(
                  bottom: -20,
                  start: -20,
                  child: CircleAvatar(
                    backgroundColor: ColorsManager.hintTextFieldColor,
                    child: Image.asset(
                      AssetsManager.userAccountIMG,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            //TODO : Use Intl Package To Format Date()
            SizedBox(width: 10.h,),
            Flexible(
              child: Text(
                DateFormat().add_jm().format(
                  DateTime.now(),
                ),
                style: TextStyle(
                  fontSize: 10.sp
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 30.h,),
      ],
    );
  }
}

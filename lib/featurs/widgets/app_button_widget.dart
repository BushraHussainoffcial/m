import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/colors.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
            colors: ColorsManager.gradientButtonColors, stops: const [0, 1, 1]),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.transparentColor,
          elevation: 0.0,
          shadowColor: ColorsManager.transparentColor
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: ColorsManager.whiteColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}


class AppAuthButtonWidget extends StatelessWidget {
  const AppAuthButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.color = ColorsManager.authButtonColor
  });

  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: onPressed==null?null:color,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: onPressed==null?ColorsManager.transparentColor:color!.withOpacity(.95),
            offset: Offset(0, 4.h),
            blurRadius: 4.sp,
          )
        ]
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.transparentColor,
            elevation: 0.0,
            shadowColor: ColorsManager.transparentColor
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: ColorsManager.whiteColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/colors.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({
    super.key,
    required this.image,
    this.onTap,
  });

  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: ColorsManager.authButtonColor.withOpacity(.5),
          shape: BoxShape.circle,
          border:
          Border.all(color: ColorsManager.borderCheckBoxColor, width: 1.5.sp,),
        ),
        child: Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: ColorsManager.whiteColor,
            shape: BoxShape.circle,
            border: Border.all(
                color: ColorsManager.borderCheckBoxColor, width: 1.5.sp),
          ),
          child: Image.asset(
            image,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ),
    );
  }
}

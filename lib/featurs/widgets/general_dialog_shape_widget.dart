import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../core/colors.dart';

import '/core/assets_manager.dart';

class GeneralDialogShapeWidget extends StatelessWidget {
  const GeneralDialogShapeWidget({
    super.key,
    this.iconPath = AssetsManager.botLoadingJSON,
  });

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: ColorsManager.whiteColor.withOpacity(.25),
                  blurRadius: 100.sp,
                  spreadRadius: 20.sp,
                )
              ],
              // gradient: LinearGradient(
              //   colors: ColorsManager.gradientButtonColors,
              //   stops: [0,1,0],
              // ),
            ),
            /// Robot Dialog
            // child: Lottie.asset(
            //   iconPath,
            //   width: 120.w,
            //   height: 120.h,
            // ),
          ),
        ],
      ),
    );
  }
}

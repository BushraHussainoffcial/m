import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helper/launcher_helper.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';

class HelperDialogWidget extends StatelessWidget {
  const HelperDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: ColorsManager.homeItemColor,
                  border: Border.all(
                      color: ColorsManager.blackColor, width: 1.5.sp),
                  borderRadius: BorderRadius.circular(
                    20.r,
                  ),
                ),
                child: Material(
                  color: ColorsManager.transparentColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          Strings.helperDialogText,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            LauncherHelper.launchEmail(
                              Strings.emailAppText,
                            );
                          },
                          child: Text(
                            textAlign: TextAlign.center,
                            Strings.emailAppText,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
              PositionedDirectional(
                end: 20.w,
                child: IconButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(
                    Icons.close,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

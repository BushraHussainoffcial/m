import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mardod/featurs/auth/screens/login_screen.dart';

import '../../../core/colors.dart';
import '../../../core/strings.dart';

class DeleteAccountDialogWidget extends StatelessWidget {
  const DeleteAccountDialogWidget({super.key});

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
                          Strings.deleteAccountText,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Center(
                        child: Text(
                          Strings.areYouSureDeleteAccountText,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),

                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(
                                    builder: (_)=> LoginScreen()
                                )
                                );
                              },
                              child: Text(
                                Strings.yesText,
                                style: TextStyle(
                                  color: ColorsManager.errorColor,
                                ),
                              )),
                          TextButton(
                              onPressed: () {
                                if(Navigator.canPop(context)){
                                  Navigator.pop(context);
                                }
                              },
                              child: Text(
                                Strings.cancelText,
                              )),
                        ],
                      )
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

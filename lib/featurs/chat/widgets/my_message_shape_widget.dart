import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../core/assets_manager.dart';
import '../../../core/colors.dart';
import '../../widgets/image_user_provider.dart';

import '../../../core/models/message_model.dart';
import '../../profile/controller/profile_controller.dart';

class MyMessageShapeWidget extends StatelessWidget {
  const MyMessageShapeWidget({super.key, required this.text, this.item});

  final String text;
  final Message? item;

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
                    child:
                    ImageUserProvider(
                      url: Get.put(ProfileController()).currentUser?.value?.photoUrl,
                      fit: BoxFit.cover,
                    )
                    // Image.asset(
                    //   AssetsManager.userAccountIMG,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
              ],
            ),
            //TODO : Use Intl Package To Format Date()
            SizedBox(width: 10.h,),
            Flexible(
              child: Text(
                DateFormat().add_jm().format(
    item?.sendingTime??
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

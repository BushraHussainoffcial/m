import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/assets_manager.dart';
import '../../../core/colors.dart';

import '../../chat/controller/chat_controller.dart';

class PopularTitlesItemWidget extends StatelessWidget {
  const PopularTitlesItemWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Get.put(ChatController()).connectionPerson(context, text, text,message: text,idGroup: text);


        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => ChatScreen(),
        //   ),
        // );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
            color: ColorsManager.pinkColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(14.r)),
        child: ListTile(
          leading: Image.asset(
            AssetsManager.starIcon2IMG,
            width: 40.sp,
            height: 40.sp,
          ),
          title: Text(
            textAlign: TextAlign.center,
            text,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

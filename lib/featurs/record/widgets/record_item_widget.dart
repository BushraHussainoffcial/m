import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mardod/core/assets_manager.dart';
import 'package:mardod/core/colors.dart';
import 'package:mardod/featurs/widgets/app_padding_widget.dart';

import '../../../core/models/chat_model.dart';
import '../../chat/controller/chat_controller.dart';
import '../../chat/controller/chat_room_controller.dart';
import '../../chat/screens/chat_screen.dart';

class RecordItemWidget extends StatelessWidget {
  const RecordItemWidget({
    super.key,
    required this.title,
    required this.date, this.chat,
  });

  final String title;
  final String date;
  final Chat? chat;

  @override
  Widget build(BuildContext context) {
    return AppPaddingWidget(
      verticalPadding: 12.h,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: ColorsManager.whiteColor,
            border: Border.all(
                color: ColorsManager.borderRecordItemColor.withOpacity(.6),
                width: 1)),
        child: ListTile(
          onTap: (){
            Get.put(ChatRoomController()).chat=chat;


            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatScreen(),
              ),
            );

          },
          dense: true,
          leading: Image.asset(AssetsManager.recordItemIconIMG),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16.sp
            ),
          ),
          subtitle: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              date,
              style: TextStyle(
                  fontSize: 12.sp, color: ColorsManager.hintTextFieldColor),
            ),
          ),
        ),
      ),
    );
  }
}

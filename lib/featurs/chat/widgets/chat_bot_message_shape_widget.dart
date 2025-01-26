import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mardod/featurs/chat/widgets/show_thanks_dialog_widget.dart';
import 'package:mardod/featurs/chat/widgets/show_your_notes_dialog_widget.dart';

import '../../../core/assets_manager.dart';
import '../../../core/colors.dart';

class ChatBotMessageShapeWidget extends StatelessWidget {
  const ChatBotMessageShapeWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final sizer = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                DateFormat().add_jm().format(
                      DateTime.now(),
                    ),
                style: TextStyle(fontSize: 10.sp),
              ),
            ),
            //TODO : Use Intl Package To Format Date()
            SizedBox(
              width: 10.h,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
                  constraints: BoxConstraints(
                    maxWidth: sizer - 110.w,
                    minWidth: 180.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color:
                        ColorsManager.chatBotMessageShapeColor.withOpacity(.8),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 14.sp, color: ColorsManager.whiteColor),
                  ),
                ),
                PositionedDirectional(
                  bottom: -20,
                  end: -20,
                  child: CircleAvatar(
                    backgroundColor: ColorsManager.menuColor,
                    child: Image.asset(
                      AssetsManager.chatBotIMG,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                PositionedDirectional(
                  bottom: -14.w,
                  start: 20.w,
                  child: Container(
                    width: 80.w,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      color: ColorsManager.menuColor.withOpacity(.8),
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierColor:
                                    ColorsManager.whiteColor.withOpacity(.5),
                                builder: (context) =>
                                    ShowYourNotesDialogWidget(),
                              );
                            },
                            child: Icon(
                              Icons.cancel,
                              size: 16.sp,
                              color: ColorsManager.whiteColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => ShowThanksDialogWidget(),
                              );
                            },
                            child: Icon(
                              Icons.check_circle_rounded,
                              size: 16.sp,
                              color: ColorsManager.whiteColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}

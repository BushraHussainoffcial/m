import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:mardod/core/models/review_model.dart';
import 'package:mardod/featurs/chat/widgets/show_thanks_dialog_widget.dart';
import 'package:mardod/featurs/chat/widgets/show_your_notes_dialog_widget.dart';

import '../../../core/assets_manager.dart';
import '../../../core/colors.dart';
import '../../../core/models/message_model.dart';
import '../../../core/strings.dart';
import '../controller/chat_controller.dart';
import '../controller/chat_room_controller.dart';

class ChatBotMessageShapeWidget extends StatelessWidget {
  const ChatBotMessageShapeWidget({super.key, required this.text, this.item, required this.isLast, this.prevMessage});

  final String text;
  final Message? item;
  final bool isLast;
  final String? prevMessage;

  @override
  Widget build(BuildContext context) {
    final sizer = MediaQuery.sizeOf(context).width;
    final bool isError=item?.textMessage.contains( Strings.errorTryAgainLater)??false;
    final bool isLoading=!(item?.checkSend??false);
    final bool isAnimation= isLast&&DateTime.now().difference(item?.sendingTime??DateTime.now()).inMinutes<1;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                DateFormat().add_jm().format(
                  item?.sendingTime??
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
                        isError?
                            ColorsManager.errorColor.withOpacity(.6)
                            : ColorsManager.chatBotMessageShapeColor.withOpacity(.8),
                  ),
                  child:
                  isLast&&DateTime.now().difference(item?.sendingTime??DateTime.now()).inMinutes<1?
                  AnimatedTextKit(
                    isRepeatingAnimation:false,
                    animatedTexts: [
                      TypewriterAnimatedText(

                    text,
                    cursor: '',
                    textStyle: TextStyle(
                        fontSize: 14.sp, color: ColorsManager.whiteColor),
                      )
                    ],
                  ):Text(
                    text,
                    style: TextStyle(
                        fontSize: 14.sp, color: ColorsManager.whiteColor)),

                    // MarkdownBody(
                    //   data: text,
                    //   styleSheet: MarkdownStyleSheet(
                    //     p:  TextStyle(color: ColorsManager.whiteColor, fontSize: 16.sp),
                    //     strong:  TextStyle(color: ColorsManager.whiteColor, fontWeight: FontWeight.bold),
                    //     em:  TextStyle(color: ColorsManager.whiteColor, fontStyle: FontStyle.italic),
                    //     h1:  TextStyle(color: ColorsManager.whiteColor, fontSize: 24.sp, fontWeight: FontWeight.bold),
                    //     h2:  TextStyle(color: ColorsManager.whiteColor, fontSize: 22.sp, fontWeight: FontWeight.bold),
                    //     h3:  TextStyle(color: ColorsManager.whiteColor, fontSize: 20.sp, fontWeight: FontWeight.bold),
                    //     a:  TextStyle(color: Colors.lightBlue), // تنسيق الروابط
                    //   ),
                    // )
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
                Visibility(
                  visible: !isError&&!isLoading&&item?.review==null,
                  child: PositionedDirectional(
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
                          if(item?.review==null)...[
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierColor:
                                    ColorsManager.whiteColor.withOpacity(.5),
                                    builder: (context) =>
                                        ShowYourNotesDialogWidget(
                                          message: item,
                                          review: ReviewModel(
                                            date: DateTime.now(),
                                            review: false,
                                            question: prevMessage,
                                            result: text,
                                            idMessage: item?.id,
                                            idChat: Get.put(ChatRoomController()).chat?.id,

                                          ) ,
                                        ),
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
                                  Get.put(ChatRoomController()).addReport(context, review: ReviewModel(
                                    date: DateTime.now(),
                                    review: true,
                                    question: prevMessage,
                                    result: text,
                                    idMessage: item?.id,
                                    idChat: Get.put(ChatRoomController()).chat?.id,

                                  ), message: item);
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (context) => ShowThanksDialogWidget(),
                                  // );
                                },
                                child: Icon(
                                  Icons.check_circle_rounded,
                                  size: 16.sp,
                                  color: ColorsManager.whiteColor,
                                ),
                              ),
                            )
                          ]else...[

                          ]

                        ],
                      ),
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

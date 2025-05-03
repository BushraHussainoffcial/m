import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:mardod/core/models/review_model.dart';
import 'package:mardod/featurs/chat/widgets/show_thanks_dialog_widget.dart';
import 'package:mardod/featurs/chat/widgets/show_your_notes_dialog_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/assets_manager.dart';
import '../../../core/colors.dart';
import '../../../core/models/message_model.dart';
import '../../../core/strings.dart';
import '../controller/chat_controller.dart';
import '../controller/chat_room_controller.dart';

class ChatBotMessageShapeWidget extends StatefulWidget {
  ChatBotMessageShapeWidget({super.key, required this.text, this.item, required this.isLast, this.prevMessage});

  String text;
  final Message? item;
  final bool isLast;
  String? prevMessage;

  @override
  State<ChatBotMessageShapeWidget> createState() => _ChatBotMessageShapeWidgetState();
}

class _ChatBotMessageShapeWidgetState extends State<ChatBotMessageShapeWidget> {
  @override
  Widget build(BuildContext context) {

    final sizer = MediaQuery.sizeOf(context).width;
    final bool isError=widget.item?.textMessage.contains( Strings.errorTryAgainLater)??false;
    final bool isLoading=!(widget.item?.checkSend??false);
    final bool isAnimation= widget.isLast&&DateTime.now().difference(widget.item?.sendingTime??DateTime.now()).inMinutes<1;


    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                DateFormat().add_jm().format(
                  widget.item?.sendingTime??
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
                    !widget.isLast&&DateTime.now().difference(widget.item?.sendingTime??DateTime.now()).inMinutes<1?
                    AnimatedTextKit(
                      onFinished:(){
                        setState(() {
                        });
                      },
                      isRepeatingAnimation:false,
                      animatedTexts: [
                        TypewriterAnimatedText(

                          widget.text,
                          cursor: '',
                          textStyle: TextStyle(
                              fontSize: 14.sp, color: ColorsManager.whiteColor),
                        ),
                      ],
                    )

                        :
                    RichText(
                      // textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style:  TextStyle( fontSize: 14.sp, color: ColorsManager.whiteColor),
                        children: [
                          TextSpan(text: widget.text),
                          if((widget.item?.resources??[]).isNotEmpty)...[
                            TextSpan(text: "\n\nالمصادر:\n"),
                            for (String link in( widget.item?.resources??[]))
                              TextSpan(
                                text: '$link\n\n',
                                style:  TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14.sp,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    final uri = Uri.parse(link);
                                    if (await canLaunchUrl(uri)) {
                                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                                    } else {
                                      debugPrint('Could not launch $link');
                                    }
                                  },
                              ),
                          ]

                        ],
                      ),
                    )

                  //   Text(
                  // text,
                  // style: TextStyle(
                  //     fontSize: 14.sp, color: ColorsManager.whiteColor)),


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
                  visible: !isError&&!isLoading&&widget.item?.review==null,
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
                          if(widget.item?.review==null)...[
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierColor:
                                    ColorsManager.whiteColor.withOpacity(.5),
                                    builder: (context) =>
                                        ShowYourNotesDialogWidget(
                                          message: widget.item,
                                          review: ReviewModel(
                                            date: DateTime.now(),
                                            review: false,
                                            question: widget.prevMessage,
                                            result: widget.text,
                                            idMessage: widget.item?.id,
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
                                    question: widget.prevMessage,
                                    result: widget.text,
                                    idMessage: widget.item?.id,
                                    idChat: Get.put(ChatRoomController()).chat?.id,

                                  ), message: widget.item);
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
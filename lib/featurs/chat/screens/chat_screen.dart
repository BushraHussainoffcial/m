import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:mardod/core/assets_manager.dart';
import 'package:mardod/core/colors.dart';
import 'package:mardod/core/strings.dart';
import 'package:mardod/core/theme_manager.dart';
import 'package:mardod/featurs/chat/widgets/chat_bot_message_shape_widget.dart';
import 'package:mardod/featurs/chat/widgets/my_message_shape_widget.dart';
import 'package:mardod/featurs/widgets/logo_widget.dart';

import '../../widgets/app_textfield_chat_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();
  List<String> _messagesList = [];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.chatText),
      ),
      body: Column(
        children: [
          Expanded(
            child: _messagesList.isEmpty
                ? Center(
                    child: Text(
                      Strings.noMessagesYetText,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 28.w,
                    ),
                    itemBuilder: (context, index) => index.isEven
                        ? MyMessageShapeWidget(
                            text: _messagesList[index],
                          )
                        : ChatBotMessageShapeWidget(text: _messagesList[index]),
                    itemCount: _messagesList.length,
                  ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            width: double.maxFinite,
            decoration:
                BoxDecoration(color: ColorsManager.whiteColor, boxShadow: [
              BoxShadow(
                color: ColorsManager.shadowLoginColor,
                blurRadius: 20.sp,
                offset: Offset(0, -8.sp),
              )
            ]),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AppTextChatFieldWidget(
                  hintText: Strings.typeYourQuestionHereText,
                  controller: _messageController,
                  iconData: AssetsManager.sendIconIMG,
                ),
                PositionedDirectional(
                  end: 10.w,
                  child: InkWell(
                    onTap: () {
                      if (_messageController.text.trim().isNotEmpty) {
                        setState(() {
                          _messagesList.add(_messageController.text);
                        });
                        _messageController.clear();
                      }
                    },
                    child: Image.asset(
                      AssetsManager.sendIconIMG,
                      width: 24.sp,
                      height: 24.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

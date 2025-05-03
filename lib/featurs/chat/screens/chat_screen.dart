import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/assets_manager.dart';
import '../../../core/colors.dart';
import '../../../core/strings.dart';
import '../widgets/chat_bot_message_shape_widget.dart';
import '../widgets/my_message_shape_widget.dart';

import '../../../core/enums/enums.dart';
import '../../../core/models/message_model.dart';
import '../../widgets/app_textfield_chat_widget.dart';
import '../../widgets/constants_widgets.dart';
import '../controller/chat_controller.dart';
import '../controller/chat_room_controller.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, this.message});

  String? message;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();
  List<String> _messagesList = [];
  late ChatRoomController controller;
  final ScrollController _scrollController = ScrollController();

  void scrollToBottom() {
    Future.delayed(Duration(milliseconds: 300), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  var initData;

  @override
  void initState() {
    controller = Get.put(ChatRoomController());
    controller.onInit();
    if (widget.message != null) {
      print(widget.message);
      sendText(message: widget.message);
    }
    // messageController.addListener(() {
    //   setState(() {});
    // });
    super.initState();
  }

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
            child: StreamBuilder<QuerySnapshot>(
                stream: controller.getChat,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ConstantsWidgets.circularProgress();
                  } else if (snapshot.connectionState ==
                      ConnectionState.active) {
                    if (snapshot.hasError) {
                      return Text(Strings.emptyData);
                      // return  Text(tr(LocaleKeys.empty_data));
                    } else if (snapshot.hasData) {
                      // ConstantsWidgets.circularProgress();
                      controller.chat?.messages.clear();
                      if (snapshot.data!.docs.length > 1) {
                        controller.chat?.messages =
                            Messages.fromJson(snapshot.data!.docs).listMessage;
                      }

                      return GetBuilder<ChatRoomController>(
                          init: controller,
                          builder: (ChatRoomController chatRoomController) {
                            WidgetsBinding.instance
                                .addPostFrameCallback((_) => scrollToBottom());
                            // Message? message=controller.waitMessage.lastOrNull;
                            // message?.checkSend=false;
                            // if(message!=null)
                            //   controller.chat?.messages.add( message);

                            controller.waitMessage
                                .map((e) => e.checkSend = false);
                            controller.chatList.clear();
                            controller.chatList
                                .addAll(controller.chat?.messages ?? []);
                            controller.chatList.addAll(controller.waitMessage);
                            controller.chatList.sort((a, b) =>
                                a.sendingTime!.compareTo(b.sendingTime!));

                            return buildChat(
                                context, controller.chatList ?? []);
                            // buildChat(context,controller.chat?.messages ?? []);
                          });
                    } else {
                      return Text(Strings.emptyData);
                      // return  Text(tr(LocaleKeys.empty_data));
                    }
                  } else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                }),
          ),

          // _messagesList.isEmpty
          //     ? Center(
          //         child: Text(
          //           Strings.noMessagesYetText,
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold, fontSize: 16.sp),
          //         ),
          //       )
          //     : ListView.builder(
          //         padding: EdgeInsets.symmetric(
          //           horizontal: 28.w,
          //         ),
          //         itemBuilder: (context, index) => index.isEven
          //             ? MyMessageShapeWidget(
          //                 text: _messagesList[index],
          //               )
          //             : ChatBotMessageShapeWidget(text: _messagesList[index]),
          //         itemCount: _messagesList.length,
          //       ),
          // ),
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
                      if (_messageController.text.trim().isNotEmpty &&
                          !(controller.waitMessage.lastOrNull?.textMessage
                                  .contains(Strings.loadingText) ??
                              false)) {

                        /// Send Ai Bot
                        sendText();


                        // setState(() {
                        //   _messagesList.add(_messageController.text);
                        // });
                        // _messageController.clear();
                      }
                    },
                    child:
                        // !(controller.waitMessage.lastOrNull?.textMessage.contains( Strings.errorTryAgainLater)??true)?
                        //     Icon(Icons.stop_circle_outlined,size: 28.sp,color: ColorsManager.chatBotMessageShapeColor,):
                        Image.asset(
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

  Widget buildChat(BuildContext context, List<Message> messages) {
    controller.chatList = messages;

    return controller.chatList.isEmpty
        ? Center(
            child: Text(
              Strings.noMessagesYetText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
          )
        : ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(
              horizontal: 28.w,
            ),
            itemBuilder: (context, index) {
              return controller.chatList[index].senderId ==
                      controller.currentUserId
                  ? MyMessageShapeWidget(
                      text: messages[index].textMessage,
                      item: messages[index],
                    )
                  : ChatBotMessageShapeWidget(
                      text: messages[index].textMessage,
                      item: messages[index],
                      prevMessage:
                          index == 0 ? null : messages[index - 1].textMessage,
                      isLast: index == (messages.length - 1),
                    );
            },
            itemCount: messages.length,
          );
  }

  sendText({String? message}) async {
    String text = message ?? _messageController.value.text.trim();
    widget.message = null;
    if (text.isNotEmpty) {
      // if (controller.messageController.value.text.trim().isNotEmpty) {

      // String message = controller.messageController.value.text;
      _messageController.clear();
      // controller.messageController.clear();
      await controller.sendMessageToChatBot(
        context,
        idChat: controller.chat?.id ?? '',
        message: Message(
          textMessage: text,
          typeMessage: TypeMessage.text.name,
          senderId: controller.currentUserId,
          receiveId: controller.recId ?? '',
          sendingTime: DateTime.now(), resources: [],
        ),
      );

      controller.update();

      Get.put(ChatController()).update();
    }
  }
}

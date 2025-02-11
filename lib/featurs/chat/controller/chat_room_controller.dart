
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mardod/core/models/review_model.dart';
import 'package:mardod/core/strings.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/models/chat_model.dart';
import '../../../../core/models/message_model.dart';
import '../../core/controllers/firebase/firebase_constants.dart';
import '../../core/controllers/firebase/firebase_fun.dart';
import '../../widgets/constants_widgets.dart';

import 'package:google_generative_ai/google_generative_ai.dart';

import '../../widgets/dialog_with_shaddow_widget.dart';
import '../widgets/show_thanks_dialog_widget.dart';



class ChatRoomController extends GetxController{
  Chat? chat  ;
  // Chat? chat = Get.arguments?["chat"] ;
  final messageController = TextEditingController();
  List<Message> chatList = [];
  List<Message> waitMessage = [];
  var getChat,getLastSeen;
  late  String currentUserId;
  String? recId;
  GenerativeModel? model;
  @override
  void onInit() {
    if(Get.arguments?["chat"] is Chat?){
      // chat=Get.arguments?["chat"];
    }
    model = GenerativeModel(
      model: 'gemini-1.5-flash',
      //TODO: add key here
      apiKey: "AIzaSyBgpa0s0IvpB7yFW6kcLfmyrgssS8XZR_A",
    );
    messageController.clear();
    waitMessage.clear();
    currentUserId=FirebaseAuth.instance.currentUser?.uid ?? '';
    recId=getIdUserOtherFromList( chat?.listIdUser??[]);
    getChatFun();
    getLastSeenFun();
    super.onInit();
    }

  getChatFun() async {
    getChat =_fetchChatStream(idChat: chat?.id??'');
    return getChat;
  }
  getLastSeenFun() async {
    getLastSeen =FirebaseFirestore.instance
        .collection(FirebaseConstants.collectionUser)
        .doc(recId)
        .snapshots();
    return getLastSeen;
  }
  @override
  void dispose() {
    waitMessage.clear();
    messageController.dispose();
    super.dispose();
  }

  _fetchChatStream({required String idChat}) {
    final result= FirebaseFirestore.instance
        .collection(FirebaseConstants.collectionChat)
        .doc(idChat)
        .collection(FirebaseConstants.collectionMessage)
        .orderBy("sendingTime")
        .snapshots();
    return result;

  }

  getIdUserOtherFromList(List<String> idUsers){
    String currentUserId=FirebaseAuth.instance.currentUser?.uid ?? '';
    for(String id in idUsers)
      if(id!=currentUserId)
        return id;
  }
  deleteChat(context,{required String idChat}) async{
    var result =await FirebaseFun
        .deleteChat(idChat: idChat);
    //ConstantsWidgets.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }
  sendMessage(context,{required String idChat,required Message message}) async{
    var result;
    ///for check tweet
    waitMessage.add(message);
    update();
    String? filePath;
    if(message.localUrl.isNotEmpty){
      filePath=await FirebaseFun.uploadImage(image:XFile(message.localUrl!),folder: FirebaseConstants.collectionMessage+'/${message.textMessage}');
    }
    message.url=filePath??'';
     // result =await ApiService.processTweet(tweet: message.textMessage);

     // if(! result['status']){
     //   ConstantsWidgets.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
     //   return result;
     // }

    waitMessage.remove(message);
    update();

     ///...........................................

    if(message.typeMessage.contains(TypeMessage.text.name)){
      result=await FirebaseFun
          .addMessage(idChat: idChat,
          message:message);
    }else{
      if(result==null){
        result =await FirebaseFun
            .addMessage(idChat: idChat,
            message:message);
      }

    }
    if(result['status']&&chat!=null&&(chat?.messages.length??0)<=1)
      {
        chat?.name=(chat?.idGroup??"")+": "+message.textMessage;
        await FirebaseFun
            .updateChat(chat: chat!);
      }
    return result;
  }
  Future<String> _sendMessageAi(String message)async {


    List last10Messages =(chat?.messages??[])
        .where((element) => currentUserId == element.senderId) // تصفية الرسائل حسب senderId
        .toList()
        .reversed // عكس القائمة للحصول على الأحدث أولًا
        .take(10) // أخذ آخر 10 عناصر فقط
        .toList();
    String lastTenQuestion=last10Messages.asMap().entries.map((entry) {
      int index = entry.key + 1; // الرقم التسلسلي (يبدأ من 1)
      Message msg = entry.value;
      return "$index- ${msg.textMessage}"; // تنسيق النص
    }).join("\n");

    if (message.trim().isEmpty) return "";

    String contextMessage =
    "";

        // chat?.idGroup=="قم بالجواب وفق السؤال او النص المرسل في الاخير\n"?"":
        // "مرحبا،اريد الاجابات ان تكون متعلقة ضمن نطاق الموضوع الرئيسي او المكان:"
        // +"\n"
        // +"-الموضوع الرئيسي أو المنطقة أو المكان: ${chat?.idGroup??''}"
        // +"\n"
        //     ;

    contextMessage+="-أخر 10 رسائل ارسلتها لك بدون اجاباتك، اعتبرها كأنها سجل سابق للمحادثة، ولا داعي لذكر اني ارست لك سجل سابق للمحادثة هذا فقط لكي انت يصبح لديك ذاكرة:"
        +"\n"
            "${lastTenQuestion}"
        +"\n"
            "-السؤال أو النص: ${message}";
    try{
      final response = await model?.generateContent([Content.text(
          (
              contextMessage
          )
        // message
      )]);
      return response?.text??"";
    }catch(e){
      return Strings.errorTryAgainLater;
    }
  }
  addReport(context,{required ReviewModel review, Message? message}) async {
    ConstantsWidgets.showLoading();
    message?.review=review.review;
    message?.reviewText=review.note;
    var result=await FirebaseFun.updateMessage(message: message!, idChat: review?.idChat??"");
    if(!result['status']){
      ConstantsWidgets.closeDialog();
      ConstantsWidgets.TOAST(context,textToast: FirebaseFun.findTextToast("فشل الارسال"??result['message'].toString()),state: result['status']);
      return;
    }
    result =await FirebaseFun.addReview(review:review);

    ConstantsWidgets.closeDialog();
    if(result['status']){
      if(review.review==true)
      showDialog(
        context: context,
        builder: (context) => ShowThanksDialogWidget(),
      );
      else
    showDialog(
        context: context,
        builder: (context) => DialogWithShadowWidget(
            text: Strings
                .reportWasReceivedSuccessfullyText));
      Timer(Duration(seconds: 2), (){
        Navigator.pop(context);

      });
      //TODO dd notification
      // Get.put(NotificationsController()).addNotification(context, notification: NotificationModel(idUser: id,typeUser: AppConstants.collectionWorker
      //     , subtitle: StringManager.notificationSubTitleNewProblem+' '+(Get.put(ProfileController())?.currentUser.value?.name??''), dateTime: DateTime.now(), title: StringManager.notificationTitleNewProblem, message: ''));

      // Get.back();
    }else
    ConstantsWidgets.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()),state: result['status']);
    return result;
  }

  sendMessageToChatBot(context,{required String idChat,required Message message}) async{
    var result;
    message.checkSend=false;
    ///for check tweet
    waitMessage.add(message);
    update();
    String? filePath;
    if(message.localUrl.isNotEmpty){
      filePath=await FirebaseFun.uploadImage(image:XFile(message.localUrl!),folder: FirebaseConstants.collectionMessage+'/${message.textMessage}');
    }
    message.url=filePath??'';
    // result =await ApiService.processTweet(tweet: message.textMessage);

    // if(! result['status']){
    //   ConstantsWidgets.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    //   return result;
    // }

    ///init message chat bot
    Message messageChatBot=Message(
      textMessage: Strings.loadingText,
      typeMessage: TypeMessage.text.name,
      senderId: message.receiveId,
      receiveId: message.senderId,
      sendingTime: DateTime.now(),
      checkSend: false,
    );
    waitMessage.add(messageChatBot);
    update();
    /// await result
    final String? textAi=await _sendMessageAi(message.textMessage);

    if(textAi?.contains(Strings.errorTryAgainLater)??true)
    {
      waitMessage.last.textMessage=textAi??'';
      update();
      return;
    }

    ///done result
    waitMessage.remove(message);
    // waitMessage.remove(messageChatBot);
    update();

    ///...........................................
    message.checkSend=true;

    if(message.typeMessage.contains(TypeMessage.text.name)){
      result=await FirebaseFun
          .addMessage(idChat: idChat,
          message:message);
    }else{
      if(result==null){
        result =await FirebaseFun
            .addMessage(idChat: idChat,
            message:message);
      }

    }
    waitMessage.remove(messageChatBot);
    update();
    messageChatBot.checkSend=true;
    messageChatBot.textMessage=textAi??'';

    if(result['status']){
      result =await FirebaseFun
          .addMessage(idChat: idChat,
          message:messageChatBot);

      if(chat!=null&&(chat?.messages.length??0)<=1)
      {
        chat?.name=(chat?.idGroup??"")+": "+message.textMessage;
        await FirebaseFun
            .updateChat(chat: chat!);
      }
    }

    return result;
  }
  deleteMessage(context,{required String idChat,required Message message}) async{
    var result =await FirebaseFun
        .deleteMessage(idChat: idChat,
        message:message);
    result['status']??ConstantsWidgets.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }

}

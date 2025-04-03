
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/strings.dart';

import '../../../../core/models/chat_model.dart';
import '../../../../core/models/message_model.dart';
import '../../../../core/models/user_model.dart';
import '../../../core/colors.dart';
import '../../../core/enums/enums.dart';
import '../../../core/style_manager.dart';
import '../../core/controllers/firebase/firebase_constants.dart';
import '../../core/controllers/firebase/firebase_fun.dart';
import '../../widgets/constants_widgets.dart';
import '../../widgets/dialog_with_shaddow_widget.dart';
import '../screens/chat_screen.dart';
import 'chat_room_controller.dart';


class ChatController extends GetxController{


  final searchController = TextEditingController();
  Chats chats=Chats(listChat: []);
  Chats chatsWithFilter=Chats(listChat: []);
  Chat chat=Chat.init();
  Chat chatSend=Chat.init();
  UserModel user=UserModel.init();
  Map<String,Message> LastMessages={};
  ///add controller
  var getUsers;
  Users users=Users(items: []);
  _getUsersFun() async {
    getUsers = FirebaseFirestore.instance
        .collection(FirebaseConstants.collectionUser)
        .snapshots();
    return getUsers;
  }
  ///
  var getChats;
  late  String currentUserId;
  @override
  void onInit() {
    searchController.clear();
    currentUserId=FirebaseAuth.instance.currentUser?.uid ?? '';
    _getChatsFun();
    _getUsersFun();
    update();
    super.onInit();
  }
  _getChatsFun() async {
    getChats = fetchChatsStream(currentUserId);

    return getChats;
  }
  @override
  void dispose() {
    super.dispose();
  }

  createChat({required List<String> listIdUser,String? idGroup,String? name}) async {
    var result=await fetchChatsByListIdUser(listIdUser: listIdUser);
    if(result['status']){
      if(result['body'].length<=0
      //     ||(
      //     (idGroup?.isNotEmpty??false)&&
      //         !(chats.listChat.any((e)=>e.idGroup?.contains(idGroup??'')??false)
      // ))
          ||(chats.listChat.length>2
      &&listIdUser.length==2
      )

      ){
        result=await FirebaseFun.addChat(

            chat:
        Chat(messages: [], listIdUser: listIdUser, date: DateTime.now(),idGroup: idGroup,name:name));
        if(result['status'])
          await FirebaseFun.addMessage(message: Message.init(),idChat:result['body']['id'] );
      }

      else
        result=FirebaseFun.errorUser("Chat already found");
    }
    update();
    return result;
  }
  connectionPerson(BuildContext context ,String? idUser,String? name,{String? idGroup,String? message}) async {
    var result;
    ConstantsWidgets.showLoading();
        {

      result = await Get.put(ChatController()).createChat(
          listIdUser: [currentUserId??'',idUser ?? ''],idGroup: message==null?idGroup??idUser:idGroup??null,name: name);


      result =  await Get.put(ChatController()).fetchChatByListIdUser(
          listIdUser: [currentUserId??'', idUser ?? '']);



      if(result['status']){
        ConstantsWidgets.closeDialog();

        Get.put(ChatRoomController()).chat=Get.put(ChatController()).chat;
        // Get.back();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(message:
            DateTime.now().difference( Get.put(ChatController()).chat.date).inMinutes>=1?null:
            message),
          ),
        );

      }else{
        ConstantsWidgets.closeDialog();
        ConstantsWidgets.TOAST(null,
            textToast: Strings.errorTryAgainLater
            , state: false);
      }
    }


  }


  fetchUserById({required String id}) async {
    user=UserModel.init();
    var result=await FirebaseFun.fetchUserId(id: id, typeUser: FirebaseConstants.collectionUser);
    if(result['status']&&result['body']!=null){
      user =UserModel.fromJson(result['body']);
    }
    return result;
  }
  fetchChatByListIdUser({required List<String> listIdUser}) async {
    var result=await createChat( listIdUser: listIdUser);
     result=await FirebaseFun.fetchChatsByListIdUser(listIdUser: listIdUser);

     if(result['status']){
       Chats chats=Chats.fromJson(result['body']);
       List<Chat> listTemp=[];
       for(var element in chats.listChat){
         bool check=true;
         for(String id in listIdUser){
           if(!element.listIdUser.contains(id))
             check=false;
         }
         for(String id in element.listIdUser){
           if(!listIdUser.contains(id))
             check=false;
         }
         if(check)
           listTemp.add(element);
       }
       chats.listChat=listTemp;
       result['body']=chats.toJson()['listChat'];
       if(chats.listChat.length>0)
       chat=chats.listChat.first;
       if(chatSend.id!=chat.id){
         chatSend=chat;
         chatSend.messages.clear();
       }
     }

    return result;
  }
  fetchChatsByListIdUser({required List listIdUser}) async {
    var result=await FirebaseFun.fetchChatsByListIdUser(listIdUser: listIdUser);
    Chats chats=Chats.fromJson(result['body']);
    List<Chat> listTemp=[];
    for(var element in chats.listChat){
      bool check=true;

      for(String id in listIdUser){
        // print(id);
        if(!element.listIdUser.contains(id))
          check=false;
      }
      // print(check);

      if(check)
        listTemp.add(element);
    }
    chats.listChat=listTemp;
    // print(chats.toJson());
    // print('---------------------------');
    result['body']=chats.toJson()['listChat'];
    return result;
  }
  Future<Map?>fetchLastMessage(context,{required String idChat}) async{
    final result=await FirebaseFun.fetchLastMessage(idChat: idChat);
    Message message=Message.init();
    if(result['status']){
      message=Message.fromJson(result['body'][0]);
    }
    /// initlast message
    LastMessages[idChat]=message;
    return message.toJson();
  }
  /// initlast message
  Future<Map?> getd(String idChat)async=>LastMessages[idChat]?.toJson()??Message(textMessage:("loading ..."), typeMessage: 'text', senderId: '', receiveId: '', sendingTime: DateTime.now() ).toJson();
  widgetLastMessage(context,{required String idChat}){
    return FutureBuilder(
      initialData:getd(idChat) ,
      future: fetchLastMessage(
          context,
          idChat: idChat),
      builder: (
          context,
          snapshot,
          ) {
        // print(snapshot.error);
        if (snapshot
            .connectionState ==
            ConnectionState
                .waiting) {
          // return  Text(
              // 'جاري التحميل ...'
          return  Text('loading ...',
              overflow: TextOverflow.ellipsis,
              style: StyleManager.font12SemiBold(
              // ,style: StyleManager.font12Regular(

                  color: ColorsManager.hintTextFieldColor));
          // return  Text(tr(LocaleKeys.loading)+' ...');
          //Const.CIRCLE(context);
        } else if (snapshot
            .connectionState ==
            ConnectionState
                .done) {
          if (snapshot
              .hasError) {
            return const Text(
                'Error');
          } else if (snapshot
              .hasData) {

            Message message =Message.fromJson(snapshot.data);

            // Map<String,dynamic> data=snapshot.data as Map<String,dynamic>;
            //homeProvider.sessions=Sessions.fromJson(data['body']);
            return Text(
              '${message.textMessage}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis
                ,style: StyleManager.font12SemiBold(
            color: ColorsManager.hintTextFieldColor)
            );
          } else {
            return  Text(
                'Empty data'
                ,style: StyleManager.font12Regular(
                color: ColorsManager.hintTextFieldColor));
          }
        } else {
          return Text(
              'State: ${snapshot.connectionState}'
              ,style: StyleManager.font12Regular(
              color: ColorsManager.hintTextFieldColor)
          );
        }
      },
    );
  }
  widgetTimeLastMessage(context,{required String idChat}){
    return FutureBuilder(
      initialData:getd(idChat) ,
      future: fetchLastMessage(
          context,
          idChat: idChat),
      builder: (
          context,
          snapshot,
          ) {
        // print(snapshot.error);
        if (snapshot
            .connectionState ==
            ConnectionState
                .waiting) {
          return  Text('${""??"loading ..."}'

              ,style:    StyleManager.font12Regular(
                    color: ColorsManager.blackColor.withOpacity(.75)));
          // return  Text(tr(LocaleKeys.loading)+' ...');
          //Const.CIRCLE(context);
        } else if (snapshot
            .connectionState ==
            ConnectionState
                .done) {
          if (snapshot
              .hasError) {
            return const Text(
                'Error');
          } else if (snapshot
              .hasData) {

            Message message =Message.fromJson(snapshot.data);
            // Map<String,dynamic> data=snapshot.data as Map<String,dynamic>;
            //homeProvider.sessions=Sessions.fromJson(data['body']);
            return Text(
                // '${message.textMessage}',
              DateFormat().add_jm().format(message.sendingTime??DateTime.now()),
              maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:    StyleManager.font12Regular(
            color: ColorsManager.blackColor.withOpacity(.75)),
            );
          } else {
            return  Text(
                ''
                ,   style: StyleManager.font10Regular(
                color: ColorsManager.blackColor),);
          }
        } else {
          return Text(
            ""
              // 'State: ${snapshot.connectionState}'
              ,   style: StyleManager.font10Regular(
              color: ColorsManager.blackColor),
          );
        }
      },
    );
  }



  fetchChatsStream(String idUser) {
    final result= FirebaseFirestore.instance
        .collection(FirebaseConstants.collectionChat)
        .where('listIdUser',arrayContains: idUser)
    //    .orderBy("date")
        .snapshots();
    return result;

  }
  addMessage(context,{required String idChat,required Message message}) async{
    message.sendingTime=DateTime.now();
    var result =await FirebaseFun
        .addMessage(idChat: idChat,
        message:message);
    //print(result);
    result['status']??ConstantsWidgets.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }
  deleteMessage(context,{required String idChat,required Message message}) async{
    var result =await FirebaseFun
        .deleteMessage(idChat: idChat,
        message:message);
    result['status']??ConstantsWidgets.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));

    return result;
  }
  deleteChat(context,{required String idChat}) async{
    ConstantsWidgets.showLoading();
    var result =await FirebaseFun
        .deleteChat(idChat: idChat);
    ConstantsWidgets.closeDialog();
    if(result['status']){

      ConstantsWidgets.closeDialog();
    // PersonModel? person=Get.put(HomePersonsController()).persons.items.where((element)=>element.idChat==idChat).firstOrNull;
    // if(person!=null){
    //   person.idChat=null;
    //   await FirebaseFun.updatePerson(person:person!);
    // }
    }
    // ConstantsWidgets.closeDialog();
    //ConstantsWidgets.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }



  deleteChatsByIdUser(context,{required List listIdUser}) async{
    ConstantsWidgets.showLoading();
    var result =await FirebaseFun
        .deleteChatsByIdUser(listIdUser: listIdUser);
    ConstantsWidgets.closeDialog();
    if(result['status']){


      showDialog(
        context: context,
        builder: (context) =>
            DialogWithShadowWidget(
                text: Strings.clearLogDoneText
            ),
      );
      Timer(Duration(seconds: 2), (){
        Navigator.pop(context);

      });

    }else{
      ConstantsWidgets.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()),state:result['status'] );
    }
    // ConstantsWidgets.closeDialog();
    //ConstantsWidgets.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }
  sendMessage(context,{required String idChat,required Message message}) async{
    var result;
    if(message.typeMessage.contains(TypeMessage.text.name)){
      await FirebaseFun
          .addMessage(idChat: idChat,
          message:message);
    }else{
      result =await FirebaseFun
          .addMessage(idChat: idChat,
          message:message);
    
    }
    return result;
  }
  checkUsersIsAdd(){
    for(UserModel userModel in users.items){
     if(_checkUserIsAddChats(chats.listChat,userModel.id))
        userModel.isAdd=true;
    }
  }
  removeCurrentUser(){
    users.items.removeWhere((element) => element.id==FirebaseAuth.instance.currentUser?.uid);

  }
  bool _checkUserIsAddChats(List<Chat> chats,String? idUSer){
    return getChatByUserId(chats, idUSer)!=null;
  }
  Chat? getChatByUserId(List<Chat> chats,String? idUSer){
    for (Chat chat in chats)
      if(chat.listIdUser.contains(idUSer))
        return chat;
    return null;
  }

  filterChats({required String term}) async {

    chatsWithFilter.listChat=[];
    chats.listChat.forEach((element) {
      // final List<UserModel?> users=element.listIdUser.map((e)=>Get.put(ProcessController()).fetchLocalUser(idUser: e)).toList();
      // final isFoundUser=users.any((e)=>
      // (e?.name?.toLowerCase().contains(term.toLowerCase())??false)
      // ||(e?.email?.toLowerCase().contains(term.toLowerCase())??false)
      // );

      if((element.id.toLowerCase().contains(term.toLowerCase())??false)
      // ||isFoundUser
      )
        chatsWithFilter.listChat.add(element);
    });
    update();
  }
  onError(error){
    return {
      'status':false,
      'message':error,
      //'body':""
    };
  }
}

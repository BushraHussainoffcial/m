import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/colors.dart';
import '../../../core/strings.dart';

import '../../../core/models/chat_model.dart';
import '../../chat/controller/chat_controller.dart';
import '../../widgets/constants_widgets.dart';
import '../widgets/record_item_widget.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  late ChatController chatController;

  @override
  void initState() {
    chatController = Get.put(ChatController());
    chatController.onInit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.whiteColor,
        title: Text(
          Strings.logText,
        ),
      ),
      body:
      StreamBuilder<QuerySnapshot>(
          stream: chatController.getChats,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return    ConstantsWidgets.circularProgress();
            } else if (snapshot.connectionState ==
                ConnectionState.active) {
              if (snapshot.hasError) {
                return  Text(Strings.emptyData);
                // return  Text(tr(LocaleKeys.empty_data));
              } else if (snapshot.hasData) {
                ConstantsWidgets.circularProgress();
                chatController.chats.listChat.clear();
                if (snapshot.data!.docs.length > 0) {
                  chatController.chats = Chats.fromJson(snapshot.data!.docs);
                }
                chatController.filterChats(term: chatController.searchController.value.text);
                return
                  (chatController.chatsWithFilter.listChat.isEmpty)
                      ?
                  Center(
                    child: Text(
                      Strings.noRecordsYetText,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                  ):
                  buildChats(context, chatController.chatsWithFilter.listChat ?? []);



              } else {
                return  Text(Strings.emptyData);
                // return  Text(tr(LocaleKeys.empty_data));
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          }),

      // ListView.builder(
      //     itemBuilder: (context,index)=>RecordItemWidget(
      //       title: Constants.recordItems[index].title,
      //       date: Constants.recordItems[index].date,
      //     ),
      //     itemCount: Constants.recordItems.length
      // ),
    );
  }
  Widget buildChats(BuildContext context,List<Chat> items){

    return
      GetBuilder<ChatController>(
          builder: (ChatController controller)=>

              ListView.builder(
                  itemBuilder: (context,index)=>RecordItemWidget(
                    title: items[index].name?? items[index].idGroup??'',
                    date: DateFormat("dd MMM yyyy hh:mm a").format(items[index].date??DateTime.now()) ,
                      chat:items[index]
                  ),
                  itemCount: items.length
              ),

      );




  }

}

import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String id;
  bool checkSend;
  num statSend;
  int index;
  String textMessage;
  int sizeFile;
  String url;
  // String urlTempPhoto;
  String localUrl;
  String typeMessage;
  String? typeFile;
  String senderId;
  String receiveId;
  // String replayId;
  DateTime? sendingTime;
  bool? review;
  String? reviewText;
  List<String> resources;
  Message(
      {this.id="",
        this.index=-1,
        this.sizeFile=0,
        this.checkSend=true,
        this.statSend=0,
        required this.textMessage,
        this.url="",
        // this.urlTempPhoto="",
        this.localUrl="",
        // required this.replayId,
        required this.typeMessage,
        required this.senderId,
        required this.receiveId,
         this.typeFile,
         this.review,
         this.reviewText,
        required this.resources,
        required this.sendingTime});
  factory Message.fromJson( json){
    var data = ['_JsonDocumentSnapshot','_JsonQueryDocumentSnapshot'].contains(json.runtimeType.toString())?json.data():json;

    List<String> tempResources = [];
    for(String user in json["resources"]){
      tempResources.add(user);
    }
    String tempUrl="";
    if(!data["typeMessage"]?.contains('text')){
      tempUrl=data["url"];
    }
    String tempLocalUrl="";
    tempLocalUrl=data["localUrl"]??'';
    // if(json.containsKey("localUrl")){
    //   tempLocalUrl=json["localUrl"];
    // }
    int tempSizeFile=0;
    tempSizeFile=data["sizeFile"]??0;
    // if(json.containsKey("sizeFile")){
    //   tempSizeFile=json["sizeFile"];
    // }
    // String tempUrlTempPhoto="";
    // if(json.data().containsKey("urlTempPhoto")){
    //   tempUrlTempPhoto=json["urlTempPhoto"];
    // }
    // var data = ['_JsonDocumentSnapshot','_JsonQueryDocumentSnapshot'].contains(json.runtimeType.toString())?json.data():json;

    return Message(
      url: tempUrl,
      localUrl: tempLocalUrl,
      textMessage: data["textMessage"],
      typeMessage: data["typeMessage"],
      sendingTime: data["sendingTime"]?.toDate(),
      senderId: data["senderId"],
      receiveId: data["receiveId"],
      index: data["index"],
      typeFile: data["typeFile"],
      review: data["review"],
      reviewText: data["reviewText"],
      resources: tempResources,
      // urlTempPhoto: tempUrlTempPhoto,
      sizeFile: tempSizeFile,
      // replayId: json["replayId"]
    );
  }
  Map<String,dynamic> toJson() {
    List tempResources = [];
    for(String user in resources){
      tempResources.add(user);
    }

    return {
      'textMessage': textMessage,
      'typeMessage': typeMessage,
      'senderId': senderId,
      'receiveId': receiveId,
      'sendingTime': sendingTime==null?sendingTime:Timestamp.fromDate(sendingTime!),
      'index': index,
      // 'typeFile': typeFile,
      'resources': tempResources,
      // 'urlTempPhoto': urlTempPhoto,
      // 'sizeFile': sizeFile,
      // 'replayId': replayId,
      // 'url': url,
      // 'localUrl': localUrl,
      'review': review,
      'reviewText': reviewText,
    };
  }
  factory Message.init(){
    return Message(textMessage: '', senderId: '', receiveId: '', sendingTime: DateTime.now(), typeMessage: 'text', resources: []);
  }
}
//Messages
class Messages {
  List<Message> listMessage;



  Messages({required this.listMessage});

  factory Messages.fromJson(json) {
    List<Message> temp = [];
    for (int i = 1; i < json.length; i++) {
      Message tempElement = Message.fromJson(json[i]);
      tempElement.id = json[i].id;
      temp.add(tempElement);
    }
    return Messages(listMessage: temp);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> temp = [];
    for (var element in listMessage) {
      temp.add(element.toJson());
    }
    return {
      'listMessage': temp,
    };
  }
}
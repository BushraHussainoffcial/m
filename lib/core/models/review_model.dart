import 'message_model.dart';

class ReviewModel {
  String id;
  String? idChat;
  String? idMessage;
  bool? review;
  String? note;
  String? question;
  String? result;
  DateTime date;

  ReviewModel({
    this.id='',
     this.result,
     this.question,
     this.note,
     this.review,
     this.idMessage,
     this.idChat,

    required this.date,
  });
  factory ReviewModel.fromJson( json){
    var data = ['_JsonDocumentSnapshot','_JsonQueryDocumentSnapshot'].contains(json.runtimeType.toString())?json.data():json;

    return ReviewModel(
      id: json['id'],
      result: data['result'],
      question: data['question'],
      note: data['note'],
      review: data['review'],
      idMessage: data['idMessage'],
      idChat: data['idChat'],
      date: json["date"].toDate(),
    );
  }

  Map<String,dynamic> toJson(){

    return {
      'id':id,
      'date':date,
      'result':result,
      'question':question,
      'note':note,
      'idMessage':idMessage,
      'idChat':idChat,
      'review':review,
    };
  }
  factory ReviewModel.init(){
    return ReviewModel( date: DateTime.now());
  }
}

//Review
class Reviews {
  List<ReviewModel> listChat;

  //DateTime date;

  Reviews({required this.listChat});

  factory Reviews.fromJson(json) {
    List<ReviewModel> temp = [];

    for (int i = 0; i < json.length; i++) {
      ReviewModel tempElement = ReviewModel.fromJson(json[i]);
      tempElement.id = json[i].id;
      temp.add(tempElement);
    }
    return Reviews(listChat: temp);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> temp = [];
    for (var element in listChat) {
      temp.add(element.toJson());
    }
    return {
      'list': temp,
    };
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lab_controller/model/history_model.dart';

class HistoryController extends GetxController{
  var isLoading=false;
  var historyList=<HistoryModel>[];
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  RxList<HistoryModel> history=RxList<HistoryModel>([]);
  
  @override
  void onInit(){
    super.onInit();
    collectionReference=firestore.collection("history");
    history.bindStream(getAllHistory());
  }

  Stream<List<HistoryModel>>getAllHistory()=>
    collectionReference.snapshots().map((query) =>
      query.docs.map((item) => HistoryModel.fromMap(item)).toList());

//   Future<void> getHistoryDate() async{
//     try{
//       QuerySnapshot histories=await FirebaseFirestore.instance.collection('history').get();
//       historyList.clear();
//       for(var history in histories.docs){
//         historyList.add(
//             HistoryModel(
//                 history['username'],
//                 history['email'],
//                 history['deviceNum'],
//                 history['dateFrom'],
//                 history['dateTo'],
//                 history.id));
//       }
//       isLoading=false;
//     }catch(e){
//       Get.snackbar('Error', '${e.toString()}');
//     }
// }


String formattedDate(timeStamp){
    var dateFromTimeStamp=
        DateTime.fromMicrosecondsSinceEpoch(timeStamp.seconds *1000);
    return DateFormat('dd-MM-yyyy hh:mm a').format(dateFromTimeStamp);
  }
}
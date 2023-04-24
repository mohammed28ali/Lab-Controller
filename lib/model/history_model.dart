import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class HistoryModel{
  String? username;
  String? email;
  String? deviceNum;
  String? dateFrom;
  String? dateTo;
  String? id;

  HistoryModel({
    this.username,
    this.email,
    this.deviceNum,
    this.dateFrom,
    this.dateTo,
  });
  HistoryModel.fromMap(DocumentSnapshot date){
    username=date["username"];
    email=date["email"];
    deviceNum=date["deviceNum"];
    dateFrom=formattedDate(date["dateFrom"]);
    dateTo=formattedDate(date["dateTo"]);
  }
  String formattedDate(timeStamp){
    var dateFromTimeStamp=
    DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds *1000);
    return DateFormat.yMEd().add_jms().format(dateFromTimeStamp);
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class SwitchController extends GetxController{

final realTimeDatabase = FirebaseDatabase.instance;
  var status=0;
  Future<void> changeSwitchState(var status)async{
   await realTimeDatabase.ref('https://console.firebase.google.com/project/security-project-e7b1c/database/security-project-e7b1c-default-rtdb/data/~2F').child('allDevices').child('device1').set(0);
   update();
  }

}
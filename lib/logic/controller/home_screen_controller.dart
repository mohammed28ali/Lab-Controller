import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  late DatabaseReference dbRef;
  late var stateCurr;

  @override
  void onInit(){
    super.onInit();
    dbRef=FirebaseDatabase.instance.ref();
  }
  changeStateToOne(String deviceName) {
    dbRef.child('allDevices').child(deviceName).set(1);

    }
  changeStateToZero(String deviceName) {
    dbRef.child('allDevices').child(deviceName).set(0);
    }

    currentState(String deviceName){
    dbRef.child('allDevice').child(deviceName).once().then((DatabaseEvent databaseEvent) {
      stateCurr=databaseEvent.snapshot.value.toString();
    });
    update();
    }

}
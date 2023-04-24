import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lab_controller/model/user_model.dart';

class UserProfileController extends GetxController {
  FirebaseAuth auth=FirebaseAuth.instance;

  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }


  Rx<UserModel> userModel=UserModel(
      userId: "",
      email: "",
      name: "",
      pic: "",
      id: "",
      nationality: "",
      address: "",
      homeNum: "",
      phoneNum: "",
      role: "",
      gender: "").obs;

  @override
  void onInit() {
    super.onInit();
    FirebaseFirestore.instance.collection('Users')
        .doc(auth.currentUser?.uid)
        .get()
        .then((value) {
          if(value.exists){
            userModel.value=
                UserModel.fromJson(value.data() as Map<String,dynamic> );
          }
    });
  }

}
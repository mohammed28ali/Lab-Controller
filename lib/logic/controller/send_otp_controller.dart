import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_controller/logic/controller/home_screen_controller.dart';


class SendOtpController extends GetxController{
  var state=''.obs;
  var isLoading = false.obs;
  var verId='';
  var auth=FirebaseAuth.instance;
  bool isVisibility = false;
  final homeController = Get.put(HomeScreenController());

  verifyPhone(String phone)async{
    await auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 40),
        phoneNumber:phone ,
        verificationCompleted: (AuthCredential authCredential){
          if (auth.currentUser != null) {
            isLoading.value = false;
            state.value = "Verify successfully";
          }
        },
        verificationFailed: (authException){
          Get.snackbar('Error', authException.message.toString());
        },
        codeSent: ( id,forceResent)  {
          isLoading.value = false;
          verId=id;
          state.value='Send OTP Success';
        },
        codeAutoRetrievalTimeout: (id){
          verId=id;
        }
    );
  }

  verifyOTP(String otp,deviceNum)async{
    isLoading.value = true;
    var credential =await auth.signInWithCredential(
            PhoneAuthProvider.credential(verificationId: verId, smsCode: otp)
        );
    if(credential!=null){
      if(deviceNum=='device1'){
        homeController.changeStateToOne('device1');
        Get.back();
      }else if(deviceNum=='device2'){
        homeController.changeStateToOne('device2');
        Get.back();
      }else if(deviceNum=='device3'){
        homeController.changeStateToOne('device3');
        Get.back();
      }
    }else{
      Get.snackbar(
        "otp info", "otp code is not correct !!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }
}
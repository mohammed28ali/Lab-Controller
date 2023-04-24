
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_controller/logic/controller/auth_controller.dart';
import 'package:lab_controller/logic/controller/user_profile_controller.dart';
import 'package:lab_controller/utils/theme.dart';
import 'package:lab_controller/view/widgets/text_utils.dart';

class ProfileWidget extends StatelessWidget {
   ProfileWidget({Key? key}) : super(key: key);

  final controller=Get.find<UserProfileController>();
  final authController =Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 85,),
                Hero(tag: 'profile photo ',
                  child: Obx(()=>
                  controller.userModel.value.pic==""?
                  const CircleAvatar(backgroundImage: AssetImage('assets/images/user_profile.png'),
                    maxRadius: 70,
                  ):CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        controller.userModel.value.pic
                    ),
                    maxRadius: 70,
                  )),),
              ],
            ),
            Container(
              width: double.infinity,
              margin:
              const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
              height: 35,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: mainColor,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.person,color: mainColor,),
                  SizedBox(width: 20,),
                  TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    text: controller.capitalize(authController.displayUserName.value),
                    color: Colors.black,
                    underline: TextDecoration.none,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 35,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: mainColor,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.email,color: mainColor,),
                  SizedBox(width: 20,),
                  TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    text: authController.displayUserEmail.value,
                    color: Colors.black,
                    underline: TextDecoration.none,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 35,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: mainColor,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.phone,color: mainColor,),
                  SizedBox(width: 20,),
                  TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    text: controller.userModel.value.phoneNum==""?"no phone":controller.userModel.value.phoneNum,
                    color: Colors.black,
                    underline: TextDecoration.none,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 35,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: mainColor,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.home,color: mainColor,),
                  SizedBox(width: 20,),
                  TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    text: controller.userModel.value.address==""?"no address":controller.userModel.value.address,
                    color: Colors.black,
                    underline: TextDecoration.none,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 35,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: mainColor,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.person_pin_rounded,color: mainColor,),
                  SizedBox(width: 20,),
                  TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    text: controller.userModel.value.id==""?"no id":controller.userModel.value.id,
                    color: Colors.black,
                    underline: TextDecoration.none,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 35,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: mainColor,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.flag,color: mainColor,),
                  SizedBox(width: 20,),
                  TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    text: controller.userModel.value.nationality==""?"no id":controller.userModel.value.nationality,
                    color: Colors.black,
                    underline: TextDecoration.none,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 35,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: mainColor,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.maps_home_work_outlined,color: mainColor,),
                  SizedBox(width: 20,),
                  TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    text: controller.userModel.value.homeNum==""?"no home number":controller.userModel.value.homeNum,
                    color: Colors.black,
                    underline: TextDecoration.none,
                  ),
                ],
              ),
            ),
          ],
        ),)
      ],
    );
  }
}

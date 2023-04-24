import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_controller/logic/controller/auth_controller.dart';
import 'package:lab_controller/utils/theme.dart';

class RoleSelection extends StatelessWidget {

  AuthController authController=Get.put(AuthController());

  RoleSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            " Role      ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),

          ),
          Row(
            children: [
              Obx(
                    ()=> Radio(
                  value: "Staff",
                  groupValue: authController.selectedRole.value,
                  onChanged: (value){
                    authController.onChangeRole(value);
                  },
                  activeColor: mainColor,
                  fillColor:MaterialStateProperty.all(mainColor) ,
                ),
              ),
              const Text(
                "Staff",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),

            ],
          ),
          const SizedBox(width: 20,),
          Row(
            children: [
              Obx(
                    ()=> Radio(
                  value: "Student",
                  groupValue: authController.selectedRole.value,
                  onChanged: (value){
                    authController.onChangeRole(value);
                  },
                  activeColor: mainColor,
                  fillColor:MaterialStateProperty.all(mainColor) ,
                ),
              ),
              const Text(
                "Student",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}

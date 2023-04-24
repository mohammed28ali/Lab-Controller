import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_controller/logic/controller/auth_controller.dart';
import 'package:lab_controller/view/widgets/text_utils.dart';

class CheckWidget extends StatelessWidget {
   CheckWidget({Key? key}) : super(key: key);

  final controller=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AuthController>(builder:(_){
      return Row(
        children: [
          InkWell(
            onTap: (){
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),

              ),
              child: controller.isCheckBox?Image.asset("assets/images/check.png"):
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),

                ),

              ),
            ),
          ),
          const SizedBox(width: 10,),
          Row(
            children: const [
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: 'I accept ',
                color: Colors.black,
                underline: TextDecoration.none,
              ),
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: 'terms & conditions',
                color: Colors.black,
                underline: TextDecoration.underline,
              ),
            ],
          ),
        ],
      );
    });
  }
}

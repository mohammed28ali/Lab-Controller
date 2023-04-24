import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_controller/logic/controller/user_profile_controller.dart';
import 'package:lab_controller/utils/theme.dart';
import 'package:lab_controller/view/widgets/auth/profile_widget.dart';
import 'package:lab_controller/view/widgets/logout_widgert.dart';
import 'package:lab_controller/view/widgets/text_utils.dart';

class UserProfileScreen extends StatelessWidget {

   UserProfileScreen({Key? key,}) : super(key: key);

  final userProfileController = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileWidget(),
          const SizedBox(height: 10,),
          const Divider(color: Colors.grey,thickness:2 ,),
          const SizedBox(height: 20,),
          const TextUtils(fontSize: 18,
              fontWeight: FontWeight.bold,
              text: 'General',
              color: mainColor,
              underline: TextDecoration.none,
          ),
          const SizedBox(height: 20,),
          //IconWidget(),
          const SizedBox(height: 20,),
          LogOutWidget(),

        ],
      ),
    );
  }
}

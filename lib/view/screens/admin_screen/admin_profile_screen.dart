import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_controller/utils/theme.dart';
import 'package:lab_controller/view/widgets/auth/profile_widget.dart';
import 'package:lab_controller/view/widgets/logout_widgert.dart';
import 'package:lab_controller/view/widgets/text_utils.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          //ProfileWidget(),
          Row(
            children: [
              Container(
                height: 100,
                width:69 ,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png',),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TextUtils(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    text: 'ADMIN',
                    color: Colors.black,
                    underline: TextDecoration.none,
                  ),
                  TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    text: 'admin@admin.com',
                    color: Colors.black,
                    underline: TextDecoration.none,
                  ),
                ],
              ),
            ],
          ),
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

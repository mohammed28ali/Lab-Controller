import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lab_controller/logic/controller/switch_controller.dart';
import 'package:lab_controller/logic/controller/user_main_screen_controller.dart';
import 'package:lab_controller/utils/theme.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainScreenController>();


  @override
  Widget build(BuildContext context) {
    return Center(
      child:  AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Obx(() {
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: mainColor,
                leading: Container(),
                title: Text(controller.title[controller.currentIndex.value]),
                centerTitle: true,
              ),
              backgroundColor: Colors.white,
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: mainColor,
                currentIndex: controller.currentIndex.value,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.computer_rounded,
                      color: mainColor,
                      size: 30,
                    ),
                    icon: Icon(
                      Icons.computer_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Iconsax.profile_circle,
                      color: mainColor,
                      size: 30,
                    ),
                    label: 'Profile',
                    icon: Icon(
                      Iconsax.profile_circle,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
                onTap: (index) {
                  controller.currentIndex.value = index;
                },
              ),
              body: IndexedStack(
                index: controller.currentIndex.value,
                children: controller.tabs.value,
              ),
            );
          }),
        ),
      ),
    );
  }
}

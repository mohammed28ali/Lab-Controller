
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lab_controller/logic/controller/admin_main_screen_controller.dart';
import 'package:lab_controller/utils/theme.dart';

class AdminMainScreen extends StatelessWidget {
   AdminMainScreen({Key? key}) : super(key: key);

  final controller=Get.find<AdminMainScreenController>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
          child:Obx((){
            return Scaffold(
              appBar: AppBar(
                leading: Container(),
                title:Text(controller.title[controller.currentIndex.value]),
                centerTitle: true,
                backgroundColor: mainColor,
              ),
              backgroundColor: Colors.white,
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.white,
                currentIndex: controller.currentIndex.value,
                type: BottomNavigationBarType.fixed,
                items:
                const [
                  BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.home,
                        color: mainColor,
                      ),
                      icon: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      label: 'Home'
                  ),
                  BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.history,
                        color: mainColor,
                      ),
                      icon: Icon(
                        Icons.history,
                        color: Colors.black,
                      ),
                      label: 'Logged'
                  ),
                  BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.person_pin_sharp,
                        color: mainColor,
                      ),
                      icon: Icon(
                        Icons.person_pin_sharp,
                        color: Colors.black,
                      ),
                      label: 'Users Info'
                  ),
                  // BottomNavigationBarItem(
                  //     activeIcon: Icon(
                  //       Icons.person_off_rounded,
                  //       color: mainColor,
                  //     ),
                  //     icon: Icon(
                  //       Icons.person_off_rounded,
                  //       color: Colors.black,
                  //     ),
                  //     label: 'Blocked Users'
                  // ),
                  BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.person_pin_sharp,
                        color: mainColor,
                      ),
                      icon: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      label: 'Admin Profile'
                  ),
                ],
                onTap:(index){
                  controller.currentIndex.value=index;
                } ,
              ),
              body: IndexedStack(
                index: controller.currentIndex.value,
                children: controller.tabs.value,
              ),
            );
          }),
      ),
    );
  }
}

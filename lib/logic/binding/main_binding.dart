import 'package:get/get.dart';
import 'package:lab_controller/logic/controller/home_screen_controller.dart';
import 'package:lab_controller/logic/controller/switch_controller.dart';
import 'package:lab_controller/logic/controller/user_main_screen_controller.dart';
import 'package:lab_controller/logic/controller/user_profile_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainScreenController());
    Get.put(UserProfileController());
    Get.put(HomeScreenController());
  }
}

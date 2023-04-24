import 'package:get/get.dart';
import 'package:lab_controller/logic/controller/admin_main_screen_controller.dart';

class AdminMainBininding extends Bindings{
  @override
  void dependencies() {
    Get.put(AdminMainScreenController());
  }

}
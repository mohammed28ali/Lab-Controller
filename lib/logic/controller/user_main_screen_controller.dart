import 'package:get/get.dart';
import 'package:lab_controller/logic/controller/auth_controller.dart';
import 'package:lab_controller/view/screens/user_screen/home_screen.dart';
import 'package:lab_controller/view/screens/user_screen/user_profile_screen.dart';

class MainScreenController extends GetxController{
  RxInt currentIndex=0.obs;

  final authController = Get.put(AuthController());


  final tabs=[
     HomeScreen(),
     UserProfileScreen(),
  ].obs;
  final title=[
    "Home",
    "Profile"
  ].obs;

}
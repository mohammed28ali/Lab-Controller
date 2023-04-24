import 'package:get/get.dart';
import 'package:lab_controller/view/screens/admin_screen/admin_history_screen.dart';
import 'package:lab_controller/view/screens/admin_screen/admin_home_screen.dart';
import 'package:lab_controller/view/screens/admin_screen/admin_profile_screen.dart';
import 'package:lab_controller/view/screens/admin_screen/admin_users_info_screen.dart';

class AdminMainScreenController extends GetxController{
  RxInt currentIndex=0.obs;
  final tabs=[
     AdminHomeScreen(),
     AdminHistoryScreen(),
     AdminUsersInfoScreen(),
     AdminProfileScreen(),
  ].obs;
  final title=[
    'Home',
    'History',
    'Users Info',
    //'Blocked Users',
    'Admin Profile',
  ].obs;
}
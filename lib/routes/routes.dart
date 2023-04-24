import 'package:get/get.dart';
import 'package:lab_controller/logic/binding/admin_main_binding.dart';
import 'package:lab_controller/logic/binding/auth_binding.dart';
import 'package:lab_controller/logic/binding/home_biniding.dart';
import 'package:lab_controller/logic/binding/main_binding.dart';
import 'package:lab_controller/view/screens/admin_screen/admin_main_screen.dart';
import 'package:lab_controller/view/screens/authentication_screen/forget_pass_screen.dart';
import 'package:lab_controller/view/screens/authentication_screen/signin_screen.dart';
import 'package:lab_controller/view/screens/user_screen/main_screen.dart';
import 'package:lab_controller/view/screens/user_screen/otp_secreen.dart';
import 'package:lab_controller/view/screens/welcome_screen.dart';

import '../view/screens/authentication_screen/signup_screen.dart';

class AppRoutes

{
  //initialRoute
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
  //static const adminMainScreen=Routes.adminMainScreen;

  //getPage
  static final routes =
  [
    GetPage
      (
        name: Routes.welcomeScreen,
        page: () => const WelcomeScreen(),
      ),
    GetPage
      (
      name: Routes.loginScreen,
      page: () =>  LoginScreen(),
      binding: AuthBinding(),

    ),
    GetPage
      (
      name: Routes.signupScreen,
      page: () => SignupScreen(),
      binding: AuthBinding(),
      ),
    GetPage
      (
      name: Routes.forgetPassScreen,
      page: () => ForgetPassScreen(),
      binding: AuthBinding(),
      ),
    GetPage
      (
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [AuthBinding(),MainBinding(),HomeBinding()],
    ),
    GetPage
      (
      name: Routes.adminMainScreen,
      page: () => AdminMainScreen(),
      bindings: [AuthBinding(),AdminMainBininding()],
    ),
    GetPage
      (
      name: Routes.otpScreen,
      page: () => OtpScreen(),
    ),

  ];
}

class Routes
{
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen='/loginScreen';
  static const signupScreen='/signupScreen';
  static const forgetPassScreen='/forgetPassScreen';
  static const mainScreen='/mainScreen';
  static const adminMainScreen='/adminMainScreen';
  static const otpScreen='/otpScreen';
  static const addOtpScreen='/addOtpScreen';
}

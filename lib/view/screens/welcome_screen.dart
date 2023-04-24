import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lab_controller/routes/routes.dart';
import 'package:lab_controller/utils/theme.dart';
import 'package:lab_controller/view/screens/authentication_screen/signin_screen.dart';
import 'package:lab_controller/view/widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.2),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 100),
                      height: 60,
                      width: 190,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: TextUtils(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          text: 'Welcome',
                          color: Colors.white,
                          underline: TextDecoration.none,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsetsDirectional.only(
                            top: 10, bottom: 250),
                        height: 60,
                        width: 230,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            TextUtils(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              text: 'Lab',
                              color: mainColor,
                              underline: TextDecoration.none,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            TextUtils(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              text: 'Controller',
                              color: Colors.white,
                              underline: TextDecoration.none,
                            ),
                          ],
                        )),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                      ),
                      onPressed: () {
                        Get.offNamed(Routes.loginScreen);
                      },
                      child: const TextUtils(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        text: "Get Start",
                        color: Colors.white,
                        underline: TextDecoration.none,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextUtils(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          text: 'Don\'t have an Account?',
                          color: Colors.white,
                          underline: TextDecoration.none,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offNamed(Routes.signupScreen);
                          },
                          child: const TextUtils(
                            text: 'Sign Up',
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            underline: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

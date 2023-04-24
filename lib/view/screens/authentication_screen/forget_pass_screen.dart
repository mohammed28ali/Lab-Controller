import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_controller/logic/controller/auth_controller.dart';
import 'package:lab_controller/routes/routes.dart';
import 'package:lab_controller/utils/my_string.dart';
import 'package:lab_controller/utils/theme.dart';
import 'package:lab_controller/view/widgets/auth/auth_button.dart';
import 'package:lab_controller/view/widgets/auth/auth_text_form_field.dart';
class ForgetPassScreen extends StatelessWidget {
   ForgetPassScreen({Key? key}) : super(key: key);

  final formKey=GlobalKey<FormState>();
   final TextEditingController emailController=TextEditingController();

   final controller =Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'Forget Password',
              style: TextStyle(
                color: mainColor,

              ),
            ),
            leading:IconButton(
              onPressed: (){
                Get.offNamed(Routes.loginScreen);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ) ,
          ),
          backgroundColor: Colors.white,
          body: Form(
            key:formKey ,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: (){
                          Get.back();
                        },
                        icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "If you want to recover your account, then please provied your email Id below..",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/images/forgetpass copy.png",
                      width: 250,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AuthTextFormFiled(
                      controller: emailController,
                      obscureText: false,
                      validator: (value){
                        if(!RegExp(validationEmail).hasMatch(value)){
                          return 'Invalid email';
                        }else{
                          return null;
                        }
                      },
                      prefixIcon:Image.asset('assets/images/user.png') ,
                      suffixIcon: const Text(''),
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 50,),
                    GetBuilder<AuthController>(builder: (_){
                      return AuthButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            controller.resetPassword(emailController.text.trim());
                          }
                        },
                        text: "SEND",
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}

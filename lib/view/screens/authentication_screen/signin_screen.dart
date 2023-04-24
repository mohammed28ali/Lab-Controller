import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lab_controller/logic/controller/auth_controller.dart';
import 'package:lab_controller/routes/routes.dart';
import 'package:lab_controller/utils/my_string.dart';
import 'package:lab_controller/utils/theme.dart';
import 'package:lab_controller/view/widgets/auth/auth_button.dart';
import 'package:lab_controller/view/widgets/auth/auth_text_form_field.dart';
import 'package:lab_controller/view/widgets/auth/container_under.dart';
import 'package:lab_controller/view/widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  final fromKey=GlobalKey<FormState>();

  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  //final controller= Get.put(AuthController());

  final controller=Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/1.3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25,top: 40),
                    child: Form(
                      key: fromKey ,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              TextUtils(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                text: "LOG",
                                color: mainColor,
                                underline: TextDecoration.none,
                              ),
                              SizedBox(width:3 ,),
                              TextUtils(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                text: "IN",
                                color: Colors.black,
                                underline: TextDecoration.none,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const SizedBox(height: 20,),
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
                          const SizedBox(height: 20,),
                          GetBuilder<AuthController>(
                            builder:(_){
                              return AuthTextFormFiled(
                                controller: passwordController,
                                obscureText: controller.isVisibility ? false:true,
                                validator: (value){
                                  if(value.toString().length<6){
                                    return 'Password should be longer or equal to 6 characters';
                                  }else{
                                    return null;
                                  }
                                },
                                prefixIcon:Image.asset('assets/images/lock.png') ,
                                suffixIcon:IconButton(
                                  onPressed: (){
                                    controller.visibility();
                                  },
                                  icon:controller.isVisibility ? Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  ):  Icon(Icons.visibility_off,color: Colors.black,),
                                ) ,
                                hintText: 'Password',
                              );
                            } ,
                          ),
                          Align(
                            alignment:Alignment.centerRight,
                            child: TextButton(
                                onPressed: (){
                                  Get.offNamed(Routes.forgetPassScreen);
                                },
                                child: const TextUtils(
                                  text:"Forget Password ?" ,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize:14 ,
                                  underline:TextDecoration.none ,
                                ),
                            ),
                          ),
                          const SizedBox(height: 50,),
                          GetBuilder<AuthController>(builder: (_){
                            return AuthButton(
                              onPressed: (){
                                if(fromKey.currentState!.validate()){
                                  String email=emailController.text.trim();
                                  String password=passwordController.text;
                                  controller.loginUsingFirebase(
                                      email: email,
                                      password: password,
                                  );
                                }
                              },
                              text: 'Log In',
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                ContainerUnder(
                  text:"Don't have an Account?" ,
                  text2: "Sign Up",
                  onPressed: (){
                    Get.offNamed(Routes.signupScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lab_controller/logic/controller/auth_controller.dart';
import 'package:lab_controller/routes/routes.dart';
import 'package:lab_controller/utils/my_string.dart';
import 'package:lab_controller/utils/theme.dart';
import 'package:lab_controller/view/widgets/auth/auth_button.dart';
import 'package:lab_controller/view/widgets/auth/auth_text_form_field.dart';
import 'package:lab_controller/view/widgets/auth/check_widget.dart';
import 'package:lab_controller/view/widgets/auth/container_under.dart';
import 'package:lab_controller/view/widgets/auth/gender_selection.dart';
import 'package:lab_controller/view/widgets/auth/role_selection.dart';
import 'package:lab_controller/view/widgets/text_utils.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({Key? key}) : super(key: key);

   final fromKey=GlobalKey<FormState>();
   final authController = Get.find<AuthController>();

  final TextEditingController nameController=TextEditingController();
  final TextEditingController idController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController homeNumberController=TextEditingController();
  final TextEditingController addressController=TextEditingController();
  final TextEditingController nationalityController=TextEditingController();
  final TextEditingController phoneController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  //height: MediaQuery.of(context).size.height/1.3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25,),
                    child: Form(
                      key: fromKey ,
                      child: Column(
                        children: [
                          const SizedBox(height: 15,),
                          Row(
                            children: const [
                              TextUtils(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                text: "SIGN",
                                color: mainColor,
                                underline: TextDecoration.none,
                              ),
                              SizedBox(width:3 ,),
                              TextUtils(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                text: "UP",
                                color: Colors.black,
                                underline: TextDecoration.none,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          GetBuilder<AuthController>(builder: (_){
                            return Stack(
                              children: [
                                Obx(() => CircleAvatar(
                                  backgroundColor: Colors.grey,
                              backgroundImage: authController.isProfilePicPathSet.value == true
                                  ? FileImage(File(authController.profilePicPath.value))
                              as ImageProvider
                                  : const AssetImage('assets/images/user_profile.png'),
                              radius: 70,
                            )),

                                Positioned(
                                  bottom: -7,
                                  left: 70,
                                  child: IconButton(
                                    onPressed: ()=>authController.pickImage(),
                                    icon: const Icon(
                                      Icons.add_a_photo,
                                      color: mainColor,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                          const SizedBox(height: 20,),
                          AuthTextFormFiled(
                            controller: nameController,
                            obscureText: false,
                            validator: (value){
                              if(value.toString().length<=2||!RegExp(validationName).hasMatch(value)){
                                return'Enter Full Name';
                              }else{
                                return null;
                              }
                            },
                            prefixIcon:const Icon(Icons.drive_file_rename_outline_sharp,color: mainColor,) ,
                            suffixIcon: const Text(''),
                            hintText: 'Full Name',
                          ),
                          const SizedBox(height: 20,),
                          AuthTextFormFiled(
                            controller: idController,
                            obscureText: false,
                            validator: (value){
                              if(value.length<=2){
                                return'Enter your ID';
                              }else{
                                return null;
                              }
                            },
                            prefixIcon:Image.asset('assets/images/user.png') ,
                            suffixIcon: const Text(''),
                            hintText: 'Enter your ID',
                          ),
                          const SizedBox(height: 20,),
                          RoleSelection(),
                          const SizedBox(height: 20,),
                          GenderSelection(),
                          const SizedBox(height: 20,),
                          AuthTextFormFiled(
                            controller: nationalityController,
                            obscureText: false,
                            validator: (value){
                              if(value.toString().length<=2||!RegExp(validationName).hasMatch(value)){
                                return'Enter your Nationality';
                              }else{
                                return null;
                              }
                            },
                            prefixIcon:const Icon(Icons.flag,color: mainColor,) ,
                            suffixIcon: const Text(''),
                            hintText: 'Enter your Nationality',
                          ),
                          const SizedBox(height: 20,),
                          Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  IntlPhoneField(
                            style: const TextStyle(color: mainColor),
                            keyboardType: TextInputType.phone,
                            dropdownTextStyle: const TextStyle(color: mainColor),
                            cursorColor: mainColor,
                            decoration: const InputDecoration(
                              counterStyle: TextStyle(color: mainColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: mainColor,
                                ),
                              ),
                              fillColor:mainColor ,
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(color: mainColor),
                              focusColor: mainColor,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: mainColor,
                                ),

                              ),
                            ),
                            initialCountryCode: 'EG',
                            controller: phoneController,
                            onChanged: (phone) {

                            },
                          ),
                        ),
                          const SizedBox(height: 20,),
                          AuthTextFormFiled(
                            controller: homeNumberController,
                            obscureText: false,
                            validator: (value){
                              if(value.toString().length<=2||!RegExp(validationName).hasMatch(value)){
                                return'Invalid Home Number';
                              }else{
                                return null;
                              }
                            },
                            prefixIcon:const Icon(Icons.home_filled,color: mainColor,),
                            suffixIcon: const Text(''),
                            hintText: 'Enter Home Number',
                          ),
                          const SizedBox(height: 20,),
                          AuthTextFormFiled(
                            controller: addressController,
                            obscureText: false,
                            validator: (value){
                              if(value.toString().length<=2||!RegExp(validationName).hasMatch(value)){
                                return'';
                              }else{
                                return null;
                              }
                            },
                            prefixIcon:const Icon(Icons.home_work_sharp,color: mainColor,),
                            suffixIcon: const Text(''),
                            hintText: 'Enter Address',
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
                            prefixIcon:const Icon(Icons.email,color: mainColor,) ,
                            suffixIcon: const Text(''),
                            hintText: 'Email',
                          ),
                          const SizedBox(height: 20,),
                          GetBuilder<AuthController>(
                            builder:(_){
                              return AuthTextFormFiled(
                                controller: passwordController,
                                obscureText: authController.isVisibility ? false:true,
                                validator: (value){
                                  if(value.toString().length<6){
                                    return 'Password should be longer or equal to 6 characters';
                                  }else{
                                    return null;
                                  }
                                },
                                prefixIcon:const Icon(Icons.lock,color: mainColor,) ,
                                suffixIcon:IconButton(
                                  onPressed: (){
                                    authController.visibility();
                                  },
                                  icon:authController.isVisibility ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  ):  const Icon(Icons.visibility,color: Colors.black,),
                                ) ,
                                hintText: 'Password',
                              );
                            } ,
                          ),
                          const SizedBox(height: 20,),
                          //CheckWidget(),
                          const SizedBox(height: 50,),
                          GetBuilder<AuthController>(builder: (_){
                            return AuthButton(
                              onPressed: (){
                                  authController.signUpUsingFirebase(
                                    email:emailController.text.trim(),
                                    name:nameController.text.trim() ,
                                    password:passwordController.text,
                                    image:authController.profilePhoto,
                                    id: idController.text.trim(),
                                    address: addressController.text.trim(),
                                    nationality: nationalityController.text.trim(),
                                    homeNum: homeNumberController.text.trim(),
                                    phoneNum: '0${phoneController.text}',
                                    role:authController.selectedRole.value,
                                    gender: authController.selectedGender.value,
                                  );
                              },
                              text: 'SIGN UP',
                            );
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ContainerUnder(
                  text:"Already have an Account? " ,
                  text2: "Log In",
                  onPressed: (){
                    Get.offNamed(Routes.loginScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ) ,
    );

  }
}

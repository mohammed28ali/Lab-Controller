

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab_controller/logic/controller/auth_controller.dart';
import 'package:lab_controller/logic/controller/home_screen_controller.dart';
import 'package:lab_controller/routes/routes.dart';
import 'package:lab_controller/utils/theme.dart';
import 'package:lab_controller/view/screens/user_screen/otp_secreen.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

   final homeController = Get.put(HomeScreenController());
   final authController = Get.put(AuthController());


   @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            margin:
            const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
            height: 120,
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: mainColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.computer,
                  size: 50,
                  color: Colors.black54,
                ),
                Text(
                  'Device 1',
                  style: GoogleFonts.lato(
                      color: mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                LiteRollingSwitch(
                  //initial value
                  value: false,
                  textOn: 'ON',
                  textOff: 'OFF',
                  colorOn: Colors.greenAccent.shade700,
                  colorOff: Colors.redAccent.shade700,
                  iconOn: Icons.done,
                  iconOff: Icons.remove_circle_outline,
                  textSize: 16.0,
                  animationDuration: const Duration(milliseconds: 300),
                  onChanged: (bool state) {
                    //Use it to manage the different states
                    print('Current State of SWITCH IS: $state');
                    if(state==true){
                      Get.to(OtpScreen(),arguments:'device1');
                      //homeController.changeStateToOne('device1');
                      authController.addUserHistory('device 1');
                      print(DateTime.now());
                    }else if(state==false){
                      homeController.changeStateToZero('device1');
                      authController.updateDateTo();
                      print(DateTime.now());
                    }
                  },
                  onTap: () {
                  },
                  onSwipe: () {
                  },
                  onDoubleTap: () {},

                ),
              ],
            )),
        Container(
            width: double.infinity,
            margin:
            const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
            height: 120,
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: mainColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.computer,
                  size: 50,
                  color: Colors.black54,
                ),
                Text(
                  'Device 2',
                  style: GoogleFonts.lato(
                      color: mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),

            LiteRollingSwitch(
                        //initial value
                        value: false,
                        textOn: 'ON',
                        textOff: 'OFF',
                        colorOn: Colors.greenAccent.shade700,
                        colorOff: Colors.redAccent.shade700,
                        iconOn: Icons.done,
                        iconOff: Icons.remove_circle_outline,
                        textSize: 16.0,
                        animationDuration: const Duration(milliseconds: 300),
                        onChanged: (bool state) {
                          //Use it to manage the different states
                          print('Current State of SWITCH IS: $state');
                          if(state==true){
                            Get.to(OtpScreen(),arguments:'device2');
                            //homeController.changeStateToOne('device2');
                            authController.addUserHistory('device 2');
                          }else{
                            homeController.changeStateToZero('device2');
                            authController.updateDateTo();
                          }
                        },
                        onTap: () {},
                        onSwipe: () {},
                        onDoubleTap: () {},
                      ),
              ],
            )),
        Container(
            width: double.infinity,
            margin:
            const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
            height: 120,
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: mainColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.computer,
                  size: 50,
                  color: Colors.black54,
                ),
                Text(
                  'Device 3',
                  style: GoogleFonts.lato(
                      color: mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                LiteRollingSwitch(
                  //initial value
                  value: false,
                  textOn: 'ON',
                  textOff: 'OFF',
                  colorOn: Colors.greenAccent.shade700,
                  colorOff: Colors.redAccent.shade700,
                  iconOn: Icons.done,
                  iconOff: Icons.remove_circle_outline,
                  textSize: 16.0,
                  animationDuration: const Duration(milliseconds: 300),
                  onChanged: (bool state) {
                    //Use it to manage the different states
                    print('Current State of SWITCH IS: $state');
                    if(state==true){
                      Get.to(OtpScreen());
                      Get.to(OtpScreen(),arguments:'device3');
                      //homeController.changeStateToOne('device3');
                      authController.addUserHistory('device 3');
                    }else{
                      homeController.changeStateToZero('device3');
                      authController.updateDateTo();

                    }
                  },
                  onTap: (){

                  },
                  onSwipe: () {},
                  onDoubleTap: () {},
                ),
              ],
            )),
      ],
    );
  }
}


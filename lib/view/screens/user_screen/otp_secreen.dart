
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_controller/logic/controller/send_otp_controller.dart';
import 'package:lab_controller/routes/routes.dart';
import 'package:lab_controller/utils/theme.dart';

class OtpScreen extends StatelessWidget {
   OtpScreen({Key? key }) : super(key: key);
   final  phone=TextEditingController();
   final otp = TextEditingController();
   final sendOtpController = Get.put(SendOtpController());
   var deviceNum=Get.arguments;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text('Verify your phone'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: sendOtpController.isLoading(false) ? const Center(child: CircularProgressIndicator()) :
        ListView(children: [
          Column(
            children: [
              Form(
                  child: Column(
                    children: [
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            child: TextFormField(
                              controller:  phone,
                              keyboardType: TextInputType.phone,
                              decoration:
                              const InputDecoration(
                                  hintText: 'Enter Your Phone Number',
                                  fillColor: mainColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 3,
                                      color: mainColor
                                    )
                                  ),
                              ),
                            ),
                          )
                      ),
                      GetBuilder<SendOtpController>(
                          builder: (_){
                            return Container(
                                margin: const EdgeInsets.only(top: 40, bottom: 5),
                                child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          sendOtpController.verifyPhone(phone.text);
                                          sendOtpController.visibility();
                                          //Get.to(AddOtpScreen());
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: mainColor,
                                        ),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: mainColor,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                            horizontal: 15.0,

                                          ),
                                          child:  Row(
                                            mainAxisAlignment:MainAxisAlignment.center,
                                            children: const <Widget>[
                                              Expanded(
                                                  child: Text(
                                                    "Send OTP",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  )
                                              ),
                                            ],
                                          ),
                                        )
                                    )
                                )
                            );
                          }),
                      SizedBox(
                        height: 60,
                      ),
                      GetBuilder<SendOtpController>(
                          builder: (_){
                            return Visibility(
                              visible:sendOtpController.isVisibility?true:false,
                              child: Column(
                                children: [
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    controller: otp,
                                    decoration: const InputDecoration(
                                      hintText: "Enter OTP",
                                    ),
                                  ),
                                  const SizedBox(height: 30,),
                                  ElevatedButton(
                                    onPressed: ()  {
                                      sendOtpController.verifyOTP(otp.text,Get.arguments);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: mainColor,
                                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                        textStyle: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)
                                    ),
                                    child: const Text("VERIFY"),
                                  ),
                                ],
                              ),
                            );
                          }),

                    ],
                  )
              )
            ],
          )
        ]
        )
    );
  }
}

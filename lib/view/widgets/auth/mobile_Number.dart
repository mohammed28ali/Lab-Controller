import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lab_controller/utils/theme.dart';

class MobilNumber extends StatelessWidget {
    MobilNumber({Key? key}) : super(key: key);

  String countryValue = "";

  @override
  Widget build(BuildContext context) {


    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child:  IntlPhoneField(
        style: TextStyle(color: mainColor),
        keyboardType: TextInputType.phone,
        dropdownTextStyle: TextStyle(color: mainColor),
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
        onChanged: (phone) {
          print(phone.completeNumber);
        },
      ),
    );
  }
}

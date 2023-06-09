import 'package:flutter/material.dart';
import 'package:lab_controller/utils/theme.dart';
import 'package:lab_controller/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: mainColor,
          minimumSize: const Size(360,50),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ) ,
        ),
      child:TextUtils(
        color: Colors.white,
        text: text,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        underline: TextDecoration.none,
      ) ,
    );
  }
}

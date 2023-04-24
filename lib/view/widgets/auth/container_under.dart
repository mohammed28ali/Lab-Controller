import 'package:flutter/material.dart';
import 'package:lab_controller/utils/theme.dart';
import 'package:lab_controller/view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String text2;
  
  
  const ContainerUnder({
    required this.text,
    required this.text2,
    required this.onPressed,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        )
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              text: text,
              color: Colors.white,
              underline: TextDecoration.none,
          ),
          TextButton(
              onPressed: onPressed,
              child: TextUtils(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                text: text2,
                color: Colors.white,
                underline: TextDecoration.underline,
              ),
          ),
        ],
      ) ,
    );
  }
}

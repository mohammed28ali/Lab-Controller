import 'package:flutter/material.dart';
import 'package:lab_controller/utils/theme.dart';

class SignupAvatar extends StatelessWidget {
  const SignupAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children:  [
        CircleAvatar(
          backgroundImage:AssetImage( "assets/images/background.png"),
          radius: 80,
        ),
        Positioned(
            bottom: 0,
            child:InkWell(
              child: Icon(
                  Icons.add_a_photo_sharp,
                  color: mainColor,
              ),
              onTap: (){
                print('Cmaera clicked');
              },
            )
        ),
      ],
    );
  }
}

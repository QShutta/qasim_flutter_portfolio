import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/view/sign_up.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          Get.to(SignUp());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff0FA4DC),
          padding: EdgeInsets.only(top: 10, bottom: 10),
        ),
        child: Text(
          "3".tr,
          // "SIGN UP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

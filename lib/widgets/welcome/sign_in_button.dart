import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/view/sign_in.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          Get.to(SignIn());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: Colors.blue[300]!),
          ),
        ),
        child: Text(
          "2".tr,
          // "SIGN IN",
          style: TextStyle(
            color: Color(0xff4DB7EA),
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/view/sign_up.dart';

class SignUpLink extends StatelessWidget {
  const SignUpLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("13".tr, style: TextStyle(color: Color(0xff82808E), fontSize: 15)),
        InkWell(
          onTap: () {
            Get.to(SignUp());
          },
          child: Text(
            "3".tr,
            style: TextStyle(
              color: Color(0xff34B7E0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

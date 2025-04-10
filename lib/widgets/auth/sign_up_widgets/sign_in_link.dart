import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInLink extends StatelessWidget {
  const SignInLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("10".tr, style: TextStyle(color: Color(0xff82808E), fontSize: 15)),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Text(
            "2".tr,
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "4".tr,
      style: TextStyle(
        color: Color(0xff82808E),
        fontSize: Get.locale?.languageCode == 'ar' ? 16 : 18, // Check language
      ),
    );
  }
}

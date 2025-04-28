import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillsText extends StatelessWidget {
  const SkillsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      child: Text(
        "28".tr,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          // color: Colors.black87,
          color: Theme.of(context).textTheme.bodyLarge!.color,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

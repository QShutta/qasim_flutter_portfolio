import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactInfoText extends StatelessWidget {
  const ContactInfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Text(
        "32".tr,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
      ),
    );
  }
}

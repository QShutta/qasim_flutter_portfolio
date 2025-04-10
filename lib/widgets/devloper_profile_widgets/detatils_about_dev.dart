import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetatilsAboutDev extends StatelessWidget {
  const DetatilsAboutDev({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "16".tr,
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        height: 1.6,
        fontSize: 14,
      ),
      textAlign: TextAlign.center,
    );
  }
}

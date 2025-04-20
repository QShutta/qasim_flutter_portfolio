import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadTitle extends StatelessWidget {
  const HeadTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "14".tr,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge?.color,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}

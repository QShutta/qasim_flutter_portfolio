import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "15".tr,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge?.color,
          fontSize: 18,
        ),
      ),
    );
  }
}

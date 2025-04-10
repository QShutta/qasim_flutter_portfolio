import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 30),

      child: Text(
        "29".tr,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          // color: Colors.black87,
          color: Theme.of(context).textTheme.titleLarge!.color,

          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowersText extends StatelessWidget {
  const FollowersText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              "3174",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "17".tr,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(width: 80),
        Column(
          children: [
            Text(
              "836",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "18".tr,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

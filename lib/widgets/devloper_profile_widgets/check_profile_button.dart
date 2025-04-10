import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckProfileButton extends StatelessWidget {
  const CheckProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      child: ElevatedButton(
        onPressed: () {
          var name = Get.arguments["name"];
          var age = Get.arguments["age"];
          var jobTitle = Get.arguments["JobTitle"];
          print("You'r data is: $name, $age, $jobTitle");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 3.0),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text("21".tr, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/home_controller.dart';

class SecoundTestPage extends StatelessWidget {
  SecoundTestPage({super.key});
  final HomeController homeCon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Secound Test Page")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
              );
            },
            child: Text("Toogle"),
          ),
          ElevatedButton(
            onPressed: () {
              print("The prevous route is:${Get.previousRoute}");
            },
            child: Text("prevoius Route"),
          ),
          GetX<HomeController>(
            builder: (controller) {
              return Text("${homeCon.count1}");
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsWidget2 extends StatelessWidget {
  const SkillsWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, right: 20),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Icon(
                  FontAwesomeIcons.fire,
                  color: Color(0xFFFFCA28), // لون قريب من شعار Firebase

                  size: 50, // خليها أصغر من الـ box عشان ما تلزق في الحواف
                ),
              ),
              SizedBox(width: 40),
              SizedBox(
                width: 60,
                height: 60,
                child: Icon(
                  FontAwesomeIcons.dartLang,
                  color: Colors.blue, // لون قريب من شعار Firebase

                  size: 50, // خليها أصغر من الـ box عشان ما تلزق في الحواف
                ),
              ),
              SizedBox(width: 40),
              SizedBox(
                width: 60,
                height: 60,
                child: Icon(
                  FontAwesomeIcons.handBackFist,
                  color: Color(0xFFD32F2F), // لون أحمر أو برتقالي داكن
                  size: 50,
                ),
              ),
              SizedBox(width: 40),

              Image.asset(
                "assets/api_logo.png",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // margin: EdgeInsets.only(left: 5),
                child: Text("Firebase"),
              ),
              const SizedBox(width: 60),
              Text("Dart"),
              const SizedBox(width: 30),
              Text("Problem Solving"),
              const SizedBox(width: 20),
              Text("API"),
            ],
          ),
        ],
      ),
    );
  }
}

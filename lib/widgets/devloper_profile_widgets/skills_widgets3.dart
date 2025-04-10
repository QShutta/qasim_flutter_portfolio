import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsWidget3 extends StatelessWidget {
  const SkillsWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SkillItem(
                icon: SvgPicture.asset(
                  "assets/getx.svg",
                  width: 40,
                  height: 40,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              const SizedBox(width: 50),

              SizedBox(
                width: 60,
                height: 60,
                child: Icon(
                  FontAwesomeIcons.users,
                  color: Colors.blue, // لون أحمر أو برتقالي داكن
                  size: 50,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(right: 25, left: 20),
                child: Text("GetX"),
              ),
              // const SizedBox(width: 10),
              Container(
                margin: EdgeInsets.only(left: 20),
                // color: Colors.yellow,
                child: Text("Team Work"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillItem extends StatelessWidget {
  final Widget icon;

  const SkillItem({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: icon);
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsWidget1 extends StatelessWidget {
  const SkillsWidget1({super.key});

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
                  FontAwesomeIcons.flutter,
                  color: Theme.of(context).iconTheme.color,
                  size: 50,
                ),
              ),
              SizedBox(width: 40),
              SizedBox(
                width: 60,
                height: 60,
                child: Icon(
                  FontAwesomeIcons.github,
                  //"يا فلاتر، ما تدي اللون من عندي، شوف إنت الثيم (فاتح أو غامق) واديني اللون المناسب للأيقونات."
                  /*🎨 وشنو يعني iconTheme.color ؟
                  ده كأنك بتقول:
                  "هات اللون الافتراضي المخصص للأيقونات في الثيم ده." */
                  color: Theme.of(context).iconTheme.color,
                  size: 50,
                ),
              ),
              SizedBox(width: 40),
              SizedBox(
                width: 60,
                height: 60,
                child: Icon(
                  FontAwesomeIcons.php,
                  color: Theme.of(context).iconTheme.color,
                  size: 50,
                ),
              ),
              SizedBox(width: 40),
              SizedBox(
                width: 60,
                height: 60,
                child: Icon(
                  FontAwesomeIcons.database,
                  color: Theme.of(context).iconTheme.color,
                  size: 50,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text("Flutter"),
              ),
              const SizedBox(width: 70),
              Text("Git"),
              const SizedBox(width: 75),
              Text("PHP"),
              const SizedBox(width: 60),
              Text("MySQL"),
            ],
          ),
        ],
      ),
    );
  }
}

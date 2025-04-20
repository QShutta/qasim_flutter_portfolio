import 'package:flutter/material.dart';
import 'package:qasim_profile_info/widgets/head_title.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/header_section.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/projects_page_link.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/skills.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/skills_widgets2.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/skills_widgets3.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/subtitle.dart';

class profileTestPage extends StatelessWidget {
  const profileTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor, // استخدم لون الثيم
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSectionDev(),
              SizedBox(height: 30),
              HeadTitle(),
              SizedBox(height: 10),
              Subtitle(),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: double.infinity,
                child: Text(
                  "Skills",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              //دة بمثل الصف الاول من المهارات الموجودة في صفحة المهارات
              SkillsWidget1(),
              //دة بمثل الصف الثناي من المهارات الموجودة في صفحة المهارات
              SkillsWidget2(),
              //وهكذا .
              SkillsWidget3(),
              SizedBox(height: 20),
              ProjectsPageLink(),
            ],
          ),
        ),
      ),
    );
  }
}

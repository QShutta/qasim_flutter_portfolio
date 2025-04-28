import 'package:flutter/material.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/contact_info.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/contact_info_text.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/developer_info_app_bar.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/skills_text.dart';
import 'package:qasim_profile_info/widgets/head_title.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/header_section.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/projects_page_link.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/share_cv_button.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/skills.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/skills_widgets2.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/skills_widgets3.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/subtitle.dart';

class DevloperInfo extends StatefulWidget {
  const DevloperInfo({super.key});

  @override
  State<DevloperInfo> createState() => _DevloperInfoState();
}

class _DevloperInfoState extends State<DevloperInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeveloperInfoAppBar(),
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
              SkillsText(),
              //دة بمثل الصف الاول من المهارات الموجودة في صفحة المهارات
              SkillsWidget1(),
              //دة بمثل الصف الثناي من المهارات الموجودة في صفحة المهارات
              SkillsWidget2(),
              //وهكذا .
              SkillsWidget3(),
              SizedBox(height: 20),
              ProjectsPageLink(),
              SizedBox(height: 20),
              ShareCvButton(),
              SizedBox(height: 20),
              ContactInfoText(),
              ContactInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

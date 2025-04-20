import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/dev_info_controller.dart';
import 'package:qasim_profile_info/services/settings_services.dart';
import 'package:qasim_profile_info/widgets/head_title.dart';
import 'package:qasim_profile_info/view/welcome.dart';
import 'package:qasim_profile_info/widgets/devloper_profile_widgets/change_lang_button.dart';
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
  DevInfoController devCont = Get.find();
  final SettingsServices? settingsServices = Get.find<SettingsServices>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => Welcome());
            settingsServices?.sharePref!.clear();
          },
          icon: Icon(Icons.exit_to_app),
        ),
        actions: [
          IconButton(
            onPressed: () {
              devCont.changeTheme();
            },
            icon: Icon(Icons.dark_mode_outlined),
          ),

          ChangeLangButton(),
        ],
      ),
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
                margin: EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                child: Text(
                  "28".tr,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    // color: Colors.black87,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
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
              SizedBox(height: 20),
              ShareCvButton(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

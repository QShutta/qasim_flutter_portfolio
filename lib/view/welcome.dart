import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/welcome_contrlloer.dart';
import 'package:qasim_profile_info/widgets/auth/heder_section.dart';
import 'package:qasim_profile_info/widgets/welcome/login_text.dart';
import 'package:qasim_profile_info/widgets/welcome/sign_in_button.dart';
import 'package:qasim_profile_info/widgets/welcome/sign_up_button.dart';
import 'package:qasim_profile_info/widgets/welcome/social_media_sign_in.dart';
import 'package:qasim_profile_info/widgets/welcome/welcome_loading.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  WelcomeContrlloer welcomeContrlloer = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HeaderSection(headerText: "1".tr),
                SizedBox(height: 100),
                SignInButton(),
                SizedBox(height: 30),
                SignUpButton(),
                SizedBox(height: 120),
                LoginText(),
                SizedBox(height: 10),
                SocialMediaSignIn(),
              ],
            ),
          ),
          WelcomeLoading(), // ده حيظهر فوق كل الشاشة كلها
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/sign_up_controller.dart';
import 'package:qasim_profile_info/widgets/auth/heder_section.dart';
import 'package:qasim_profile_info/widgets/auth/sign_up_widgets/sign_in_link.dart';
import 'package:qasim_profile_info/widgets/auth/sign_up_widgets/sign_up_form.dart';
import 'package:qasim_profile_info/widgets/auth/sign_up_widgets/sign_up_loading.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpController signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HeaderSection(headerText: "3".tr),
                SizedBox(height: 80),
                SignUPForm(),
                SizedBox(height: 50),
                SignInLink(),
                SizedBox(height: 10),
              ],
            ),
          ),
          SignUpLoading(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/sign_in_controller.dart';
import 'package:qasim_profile_info/widgets/auth/sign_up_widgets/sign_up_link.dart';
import 'package:qasim_profile_info/widgets/auth/heder_section.dart';
import 'package:qasim_profile_info/widgets/auth/sign_in_widgets/loading_overlay.dart';
import 'package:qasim_profile_info/widgets/auth/sign_in_widgets/sign_in_form.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  SignInController signInController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HeaderSection(headerText: '11'.tr),
                SizedBox(height: 80),
                SignInForm(),
                SizedBox(height: 50),
                SignUpLink(),
                SizedBox(height: 10),
              ],
            ),
          ),

          LoadingOverlay(signInController: signInController),
        ],
      ),
    );
  }
}

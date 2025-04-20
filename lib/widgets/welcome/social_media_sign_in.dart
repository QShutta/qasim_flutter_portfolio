import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/welcome_contrlloer.dart';
import 'package:qasim_profile_info/services/settings_services.dart';
import 'package:qasim_profile_info/view/developer_info.dart';

class SocialMediaSignIn extends StatelessWidget {
  SocialMediaSignIn({super.key});
  final WelcomeContrlloer welcomeContrlloer = Get.find();
  final SettingsServices settingsServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.instagram,
            size: 30,
            color: Color(0xff12A2DF),
          ),
        ),
        Obx(() {
          return IconButton(
            onPressed:
                welcomeContrlloer.isLoading.value
                    ? null // تعطيل الزر أثناء التحميل
                    : () async {
                      try {
                        welcomeContrlloer.isLoading.value = true; // بدء التحميل

                        UserCredential user =
                            await welcomeContrlloer.signInWithGoogle();
                        settingsServices.sharePref!.setString(
                          "id",
                          user.user!.uid,
                        );
                        Get.offAll(DevloperInfo());
                      } catch (e) {
                        print(e);
                      } finally {
                        welcomeContrlloer.isLoading.value =
                            false; // إنهاء التحميل
                      }
                    },
            icon: FaIcon(
              FontAwesomeIcons.google,
              size: 30,
              color: Color(0xff12A2DF),
            ),
          );
        }),
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.facebook,
            size: 30,
            color: Color(0xff12A2DF),
          ),
        ),
      ],
    );
  }
}

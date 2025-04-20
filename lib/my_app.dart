// lib/my_app.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/home_controller.dart';
import 'package:qasim_profile_info/controller/my_local_controller.dart';
import 'package:qasim_profile_info/core/themes/themes.dart';
import 'package:qasim_profile_info/core/translation.dart';
import 'package:qasim_profile_info/core/utilis/binding.dart';
import 'package:qasim_profile_info/view/developer_info.dart';
import 'package:qasim_profile_info/view/my_projects_page.dart';
import 'package:qasim_profile_info/view/sign_in.dart';
import 'package:qasim_profile_info/view/sign_up.dart';
import 'package:qasim_profile_info/view/welcome.dart';
import 'package:qasim_profile_info/core/midle_ware/auth_midle_ware.dart';
import 'package:qasim_profile_info/core/utilis/sign_in_binding.dart';
import 'package:qasim_profile_info/core/utilis/sign_up_binding.dart';
import 'package:qasim_profile_info/core/utilis/welcome_binding.dart';
import 'package:qasim_profile_info/core/utilis/developer_info_binding.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MyLocalController localController = Get.put(MyLocalController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: homeController.isDark.value ? Thems.darkTheme : Thems.lightTheme,
      initialBinding: MyBinding(),
      translations: MyLocal(),
      locale: localController.initalLang,
      getPages: [
        GetPage(
          name: "/",
          page: () => Welcome(),
          binding: WelcomeBinding(),
          middlewares: [AuthMidleWare()],
        ),
        GetPage(
          name: "/SignIn",
          page: () => SignIn(),
          binding: SignInBinding(),
        ),
        GetPage(
          name: "/SignUp",
          page: () => SignUp(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: "/DevInfo",
          page: () => DevloperInfo(),
          binding: DevInfoBinding(),
        ),
        GetPage(name: "/MyProjects", page: () => MyProjectsPage()),
      ],
    );
  }
}

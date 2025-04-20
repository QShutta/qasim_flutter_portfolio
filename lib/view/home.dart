import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/home_controller.dart';
import 'package:qasim_profile_info/controller/my_local_controller.dart';
import 'package:qasim_profile_info/main.dart';
import 'package:qasim_profile_info/secound_test_page.dart';
import 'package:qasim_profile_info/view/developer_info.dart';
import 'package:qasim_profile_info/view/welcome.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  MyLocalController myLocalController = Get.find();
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    // HomeController homeCont = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(
              () => DevloperInfo(),
              arguments: {
                "name": "Qasim",
                "age": "24",
                "JobTitle": "Mobile Flutter Developer",
              },
            );
          },
          icon: Icon(Icons.person),
        ),
        actions: [
          IconButton(
            onPressed: () {
              homeController.changeTheme();
            },
            icon: Icon(Icons.dark_mode_outlined),
          ),
          IconButton(
            onPressed: () {
              Get.offAll(() => Welcome());
              sharePref!.clear();
            },
            icon: Icon(Icons.exit_to_app),
          ),
          IconButton(
            onPressed: () {
              // استرجاع اللغة الحالية المحفوظة في
              // SharedPreferences
              // إذا لم تكن هناك لغة محفوظة، سيتم تعيين
              //"en"
              //(الإنجليزية) كافتراضية
              String currentLang = sharePref?.getString("lang") ?? "en";

              // التحقق من اللغة الحالية وتحديد اللغة الجديدة
              // إذا كانت اللغة الحالية
              //"ar"
              // (العربية)، سيتم تغييرها إلى
              //"en"
              // (الإنجليزية)
              // وإذا كانت
              //"en"،
              // سيتم تغييرها إلى
              // "ar"
              String newLang = (currentLang == "ar") ? "en" : "ar";

              // استدعاء الدالة المسؤولة عن تغيير اللغة وتحديث التطبيق
              myLocalController.changeLang(newLang);
            },
            icon: Icon(Icons.language),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("${box!.read("name")}")),
          ElevatedButton(
            onPressed: () {
              box!.write("name", "AbuElqasim");
            },
            child: Text("Get Storage"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(SecoundTestPage());
            },
            child: Text("Secound Test Page"),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Passing Arguments")),
        ],
      ),
    );
  }
}

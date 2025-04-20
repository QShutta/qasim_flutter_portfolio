import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/home_controller.dart';
import 'package:qasim_profile_info/controller/my_local_controller.dart';
import 'package:qasim_profile_info/core/midle_ware/auth_midle_ware.dart';
import 'package:qasim_profile_info/core/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:qasim_profile_info/core/translation.dart';
import 'package:qasim_profile_info/core/utilis/binding.dart';
import 'package:qasim_profile_info/core/utilis/developer_info_binding.dart';
import 'package:qasim_profile_info/core/utilis/sign_in_binding.dart';
import 'package:qasim_profile_info/core/utilis/sign_up_binding.dart';
import 'package:qasim_profile_info/core/utilis/welcome_binding.dart';
import 'package:qasim_profile_info/view/developer_info.dart';
import 'package:qasim_profile_info/view/home.dart';
import 'package:qasim_profile_info/view/my_projects_page.dart';
import 'package:qasim_profile_info/view/sign_in.dart';
import 'package:qasim_profile_info/view/sign_up.dart';
import 'package:qasim_profile_info/view/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';

SharedPreferences? sharePref;
bool isLogin = false;
GetStorage? box;
// import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharePref = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDB-TrdnntSw4YyqZ46vDtBAwqItFJkwuU",
      appId: "1:675357988294:android:f0cbd6a84bc00bd3c4cec7",
      messagingSenderId: "675357988294",
      projectId: "qasimprofile",
      storageBucket: "qasimprofile.firebasestorage.app",
    ),
    //  options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // تم استخدام
  //Get.put
  // هنا بدلاً من
  //Binding
  // لأن MyLocalController و HomeController
  // كنترولرات عامة ومستخدمة في كل صفحات التطبيق،
  // لذلك الأفضل تسجيلها مرة واحدة في بداية التطبيق لتكون متاحة دائماً.
  final MyLocalController localController = Get.put(MyLocalController());
  final HomeController homeController = Get.put(HomeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final MyLocalController localController = Get.find();
    final HomeController homeController = Get.find();
    return GetMaterialApp(
      title: 'Flutter Demo',
      //لو لاحظتة احنا هنا لون التطبيق بنجيبو من ال
      //controller
      //في متغير اسمو isDark
      // المتغير دة بنحفظ فيهو الحالة سواء مظلم او مضئ .وبرضو قاعدين نحفظها في الكاش وبنجيب قيمتو من الكاش .
      //يعني المتغير الاسموisDark
      //قيمتو قاعدين نجيبها من الكاش .
      theme: homeController.isDark.value ? Thems.darkTheme : Thems.lightTheme,

      // theme: ThemeData(
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      // home: isLogin == true ? HomePage() : Welcome(),
      // home: MyProjectsPage(),
      // initialRoute: '/', //دة يعني شنو ؟
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
        // GetPage(name: "/Home", page: () => HomePage(),
        //   binding: Homeb(),

        // ),
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

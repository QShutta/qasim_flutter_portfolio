// lib/core/init_services.dart

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/services/settings_services.dart';

Future<void> initServices() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => SettingsServices().init());

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDB-TrdnntSw4YyqZ46vDtBAwqItFJkwuU",
      appId: "1:675357988294:android:f0cbd6a84bc00bd3c4cec7",
      messagingSenderId: "675357988294",
      projectId: "qasimprofile",
      storageBucket: "qasimprofile.firebasestorage.app",
    ),
  );
}

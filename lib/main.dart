import 'package:flutter/material.dart';
import 'package:qasim_profile_info/core/inital_services.dart';
import 'package:qasim_profile_info/my_app.dart';
import 'package:get_storage/get_storage.dart';

GetStorage? box;
void main() async {
  await initServices();
  runApp(MyApp());
}

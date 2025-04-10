import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/sign_up_controller.dart';

class SignUpLoading extends StatelessWidget {
  SignUpLoading({super.key});
  final SignUpController signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          signUpController.isLoading.value
              ? Container(
                color: Colors.black.withOpacity(0.5), // شفافية لتظليل الشاشة
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ), // لون الدائرة
                  ),
                ),
              )
              : const SizedBox(), // إخفاء أي محتوى عند عدم التحميل
    );
  }
}

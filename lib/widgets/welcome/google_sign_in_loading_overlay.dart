import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:qasim_profile_info/controller/welcome_contrlloer.dart';

class GoogleSignInLoadingOverlay extends StatelessWidget {
  final WelcomeContrlloer controller;
  const GoogleSignInLoadingOverlay({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          )
          : const SizedBox();
    });
  }
}

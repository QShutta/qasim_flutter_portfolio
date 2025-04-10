import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/sign_in_controller.dart';

class LoadingOverlay extends StatelessWidget {
  final SignInController signInController;

  const LoadingOverlay({super.key, required this.signInController});

  @override
  Widget build(BuildContext context) {
    // الـ Stack
    //(اللي هو زي الصينية الكبيرة اللي حاطين فيها كل الحاجات) بيسمح ليك ترصّ حاجات فوق بعض.
    // الـ
    //if (_isLoading)
    //ده زي مفتاح، لما تفتحو
    //(true)،
    //بيحط الدائرة فوق الشاشة كلها. لما تسكرو
    //(false)،
    //بيشيلو من الصينية.

    // الـ
    //SingleChildScrollView
    // هو زي "صندوق" بتحط فيهو كل الحاجات اللي المستخدم بيشوفها وممكن يسحبها لفوق وتحت
    //(scroll)
    //لو الشاشة صغيرة. لكن الـ
    //loading
    // (الدائرة اللي بتلف) ما عاوزينها تكون جزء من الصندوق ده، عاوزينها تكون "فوق" كل حاجة وما تتحرك مع الـ
    // scrolling.
    return Obx(
      () =>
          signInController.isLoading.value
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

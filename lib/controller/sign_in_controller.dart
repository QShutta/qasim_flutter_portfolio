import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/main.dart';
import 'package:qasim_profile_info/view/developer_info.dart';
import 'package:qasim_profile_info/view/home.dart';

class SignInController extends GetxController {
  RxBool obSecusreValue = true.obs;
  RxBool isLoading = false.obs; // متغير التحميل
  Rx<FocusNode> emailFocus = FocusNode().obs;
  Rx<FocusNode> passwordFocus = FocusNode().obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  emailValidator(String value) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);
    if (value.isEmpty || value == "") {
      return "This field could not be empty";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  void onFieldSubmitted(
    String text,
    BuildContext context,
    FocusNode nextFocus,
  ) {
    FocusScope.of(context).requestFocus(nextFocus);
  }

  passwordValidator(String value) {
    if (value.isEmpty || value == "") {
      return "This field could not be empty";
    } else if (value.length < 8) {
      return "the password at less should be 8 digit...";
    }
    return null;
  }

  signIn(BuildContext context) async {
    if (formKey.value.currentState!.validate()) {
      isLoading.value = true; // بدء التحميل
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text,
        );

        await sharePref!.setString("id", "1");
        Get.offAll(DevloperInfo());
      } on FirebaseAuthException catch (e) {
        String errorMessage = "An unknown error occurred.";

        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided for that user.';
        } else if (e.code == 'invalid-credential') {
          errorMessage = 'Invalid email or password.';
        } else if (e.code == 'too-many-requests') {
          errorMessage = 'Too many failed attempts. Try again later.';
        } else if (e.code == 'network-request-failed') {
          errorMessage = 'Check your internet connection and try again.';
        }

        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) {
            return AlertDialog(
              icon: Icon(Icons.error_outline, color: Colors.red, size: 40),
              title: Text(
                "Error",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Text(errorMessage, textAlign: TextAlign.center),
              actions: [
                TextButton(
                  onPressed: () {
                    // Navigator.pop(context); // No changes here
                    Get.back();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
      // الـ finally شنو من الأساس؟
      //finally
      // هو جزء من الـ
      //try-catch
      // في البرمجة، وبيشتغل زي "الخاتمة" أو "النهاية الثابتة" لأي عملية بتعملها. يعني مهما يحصل (نجاح ولا فشل)
      //، الـ
      //finally
      // دي بتتنفذ دايمًا في الآخر.
      finally {
        //                                         ليه حطينا الـ
        //_isLoading = false في
        // الـ finally؟
        // لأنك فتحت التحميل
        //(_isLoading = true)
        //في بداية الـ
        //onPressed
        //عشان تظهر الدائرة.
        // لازم تسكر التحميل في النهاية، بغض النظر إذا نجحت العملية ولا فشلت:
        // لو نجحت، بتروح للشاشة التانية، والدائرة لازم تختفي قبل ما تنتقل.
        // لو فشلت، بتظهر رسالة الخطأ، والدائرة لازم تختفي عشان المستخدم يشوف الرسالة ويتفاعل معاها.
        // الـ
        // finally
        // بتضمن إن الدائرة تتسكر في كل الحالات، عشان ما تفضلش معلقة في الشاشة.

        isLoading.value = false; // إنهاء التحميل
      }
    }
  }
}

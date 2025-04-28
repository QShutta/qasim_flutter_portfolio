import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/view/welcome.dart';

class SignUpController extends GetxController {
  RxBool obSecureValue = true.obs;
  RxBool isLoading = false.obs;
  Rx<FocusNode> nameFocus = FocusNode().obs;
  Rx<FocusNode> emailFocus = FocusNode().obs;
  Rx<FocusNode> passwordFocus = FocusNode().obs;
  Rx<FocusNode> confirmPasswordFocus = FocusNode().obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;

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

  nameValidator(String value) {
    if (value.isEmpty || value == "") {
      return "This field could not be empty";
    } else if (value.length < 3) {
      return "The name at lees should be 3 character...";
    }
    return null;
  }

  String? passwordValidator(String value) {
    String passwordPattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&*()/\\!])[A-Za-z\d@#$%^&*()/\\!]{8,}$';

    RegExp regExp = RegExp(passwordPattern);

    if (value.isEmpty) {
      return "This field cannot be empty";
    } else if (!regExp.hasMatch(value)) {
      return "Password must be at least 8 characters,\ninclude uppercase, lowercase, a number, and a symbol.";
    }
    return null;
  }

  signup(BuildContext context) async {
    if (formKey.value.currentState!.validate()) {
      //Complete from here..
      //If the user enter a valid name,passowrd,email
      //In the future will connect our app with a backend.
      //and there is a check process will happen here.
      //If all of the things are good will move to the sign in page.
      try {
        isLoading.value = true;
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text,
        );
        // Get.offAll(() => Welcome());
        //Why did we hvae tow Get.back?
        //One to discard from the alertDialog,and the secound one is to return
        //Back from the current page to the prevoius page.
        Get.offAll(Welcome());
        Get.dialog(
          AlertDialog(
            icon: Icon(
              color: Colors.green,
              Icons.check_circle_outline_outlined,
              size: 40.0,
            ),
            title: Text("Success"),
            actions: [
              Text(
                textAlign: TextAlign.center,
                "Your account has been created successfully.",
              ),
            ],
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                icon: Icon(
                  color: Colors.red,
                  Icons.error_outline_outlined,
                  size: 40.0,
                ),
                title: Text("Error"),
                actions: [
                  Text(
                    textAlign: TextAlign.center,
                    "The password provided is too weak.",
                  ),
                ],
              );
            },
          );
        } else if (e.code == 'email-already-in-use') {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                icon: Icon(
                  color: Colors.red,
                  Icons.error_outline_outlined,
                  size: 40.0,
                ),
                title: Text("Error"),
                actions: [
                  Text(
                    textAlign: TextAlign.center,

                    "The account already exists for that email",
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        print(e);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              icon: Icon(
                color: Colors.red,
                Icons.error_outline_outlined,
                size: 40.0,
              ),
              title: Text("Error"),
              actions: [Text(textAlign: TextAlign.center, "The error is :$e")],
            );
          },
        );
      } finally {
        isLoading.value = false;
      }
    }
  }
}

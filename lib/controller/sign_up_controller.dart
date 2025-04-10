import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}

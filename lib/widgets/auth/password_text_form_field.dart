import 'package:flutter/material.dart';
import 'package:qasim_profile_info/controller/sign_in_controller.dart';

class PasswordTextFormField extends StatelessWidget {
  final SignInController signInController;
  final String hintText;
  final Icon prefixIcon;
  final bool obSecureValue;
  final IconButton suffixIcon;
  final TextInputType inputType;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final TextEditingController? myController;
  final String? Function(String?)? validator;
  const PasswordTextFormField({
    super.key,
    required this.signInController,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.inputType,
    required this.myController,
    required this.validator,
    required this.currentFocus,
    required this.nextFocus,
    required this.obSecureValue,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: currentFocus,
      onFieldSubmitted: (String txt) {
        signInController.onFieldSubmitted(txt, context, nextFocus!);
      },
      validator: validator,
      obscureText: obSecureValue,
      keyboardType: inputType,
      controller: myController,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

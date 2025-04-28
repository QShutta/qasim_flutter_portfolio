import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/sign_up_controller.dart';

class SignUPForm extends StatelessWidget {
  SignUPForm({super.key});
  final SignUpController signUpController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpController.formKey.value,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: TextFormField(
              focusNode: signUpController.nameFocus.value,
              onFieldSubmitted: (value) {
                FocusScope.of(
                  context,
                ).requestFocus(signUpController.emailFocus.value);
              },
              validator: (value) {
                return signUpController.nameValidator(value!);
              },
              keyboardType: TextInputType.emailAddress,
              controller: signUpController.nameController.value,
              decoration: InputDecoration(
                hintText: "6".tr,
                prefixIcon: Icon(Icons.person_2_outlined),
                // suffixIcon: Icon(Icons.check),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
            child: TextFormField(
              focusNode: signUpController.emailFocus.value,
              onFieldSubmitted: (value) {
                FocusScope.of(
                  context,
                ).requestFocus(signUpController.passwordFocus.value);
              },
              validator: (value) {
                return signUpController.emailValidator(value!);
              },
              keyboardType: TextInputType.emailAddress,
              controller: signUpController.emailController.value,
              decoration: InputDecoration(
                hintText: "7".tr,
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),
          Obx(() {
            return Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
              child: TextFormField(
                focusNode: signUpController.passwordFocus.value,
                onFieldSubmitted: (value) {
                  FocusScope.of(
                    context,
                  ).requestFocus(signUpController.confirmPasswordFocus.value);
                },
                validator: (value) {
                  return signUpController.passwordValidator(value!);
                },
                keyboardType: TextInputType.emailAddress,
                controller: signUpController.passwordController.value,
                obscureText: signUpController.obSecureValue.value,
                decoration: InputDecoration(
                  hintText: "8".tr,
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    onPressed: () {
                      signUpController.obSecureValue.value =
                          !signUpController.obSecureValue.value;
                    },
                    icon: Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
            );
          }),
          Obx(() {
            return Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: TextFormField(
                obscureText: signUpController.obSecureValue.value,

                focusNode: signUpController.confirmPasswordFocus.value,
                validator: (value) {
                  return signUpController.passwordValidator(value!);
                },
                keyboardType: TextInputType.emailAddress,
                controller: signUpController.confirmPasswordController.value,
                decoration: InputDecoration(
                  hintText: "9".tr,
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    onPressed: () {
                      signUpController.obSecureValue.value =
                          !signUpController.obSecureValue.value;
                    },
                    icon: Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
            );
          }),

          SizedBox(height: 50),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed:
                  signUpController.isLoading.value
                      ? null
                      : () async {
                        await signUpController.signup(context);
                      },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff0FA4DC),
                padding: EdgeInsets.only(top: 10, bottom: 10),
              ),
              child: Text(
                "3".tr,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

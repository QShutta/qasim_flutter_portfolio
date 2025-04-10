import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qasim_profile_info/controller/sign_in_controller.dart';
import 'package:qasim_profile_info/widgets/auth/email_text_form_field.dart';
import 'package:qasim_profile_info/widgets/auth/password_text_form_field.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  SignInController signInController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: signInController.formKey.value,
      child: Column(
        children: [
          Obx(
            () => Container(
              margin: EdgeInsets.all(30),
              child: EmailTextFormField(
                signInController: signInController,
                hintText: 'abcdefg@gmail.com',
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.check),
                inputType: TextInputType.emailAddress,
                currentFocus: signInController.emailFocus.value,
                nextFocus: signInController.passwordFocus.value,
                myController: signInController.emailController.value,
                validator:
                    (value) => signInController.emailValidator(value ?? ''),
              ),
            ),
          ),
          Obx(
            () => Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: PasswordTextFormField(
                signInController: signInController,
                hintText: "***************",
                prefixIcon: Icon(Icons.lock_outline_rounded),

                inputType: TextInputType.text,
                myController: signInController.passwordController.value,
                validator: (value) {
                  return signInController.passwordValidator(value!);
                },
                currentFocus: signInController.passwordFocus.value,

                suffixIcon: IconButton(
                  onPressed: () {
                    signInController.obSecusreValue.value =
                        !signInController.obSecusreValue.value;
                  },
                  icon: Icon(Icons.remove_red_eye_outlined),
                ),
                nextFocus: null,
                obSecureValue: signInController.obSecusreValue.value,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 30, top: 10, bottom: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                child: Text(
                  "12".tr,
                  style: TextStyle(color: Color(0xff12A2DF)),
                ),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(height: 50),
          Obx(
            () => SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed:
                    signInController.isLoading.value
                        ? null // تعطيل الزر أثناء التحميل
                        : () async {
                          signInController.signIn(context);
                        },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0FA4DC),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                ),
                child: Text(
                  "2".tr,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

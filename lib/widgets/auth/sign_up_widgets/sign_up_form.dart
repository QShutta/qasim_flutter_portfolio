import 'package:firebase_auth/firebase_auth.dart';
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
          Container(
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
                        signUpController.obSecureValue.value;
                  },
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
            ),
          ),
          Container(
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
                        signUpController.obSecureValue.value;
                  },
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
            ),
          ),

          SizedBox(height: 50),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed:
                  signUpController.isLoading.value
                      ? null
                      : () async {
                        if (signUpController.formKey.value.currentState!
                            .validate()) {
                          //Complete from here..
                          //If the user enter a valid name,passowrd,email
                          //In the future will connect our app with a backend.
                          //and there is a check process will happen here.
                          //If all of the things are good will move to the sign in page.
                          try {
                            signUpController.isLoading.value = true;

                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                  email:
                                      signUpController
                                          .emailController
                                          .value
                                          .text,
                                  password:
                                      signUpController
                                          .passwordController
                                          .value
                                          .text,
                                );
                            print("Before of the Get.back line");
                            // Get.offAll(() => Welcome());
                            //Why did we hvae tow Get.back?
                            //One to discard from the alertDialog,and the secound one is to return
                            //Back from the current page to the prevoius page.
                            Get.back();
                            Get.back();

                            print("After the Get.back line...");
                            print(
                              "------------------------------------------------",
                            );
                            print("You'r credantial is :$credential");
                            print(
                              "------------------------------------------------",
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
                                  actions: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      "The error is :$e",
                                    ),
                                  ],
                                );
                              },
                            );
                          } finally {
                            signUpController.isLoading.value = false;
                          }
                        }
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

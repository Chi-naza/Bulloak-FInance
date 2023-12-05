import 'package:bulloak_fin_mgt_fin_mgt/controllers/auth_controller.dart';
import 'package:bulloak_fin_mgt_fin_mgt/services/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../colors.dart';
import '../../widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final regKey = GlobalKey<FormState>();

  var authController = Get.find<AuthController>();

  // text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPSWDController = TextEditingController();

  String password = '';
  bool obscureText = true;
  bool ObscureTextPSWDConfirm = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPSWDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: regKey,
          child: Center(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: h * 0.06),
                child: Text(
                  'Create New Account',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: h * 0.025),
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),
              //////
              Padding(
                padding: EdgeInsets.only(left: w * 0.08, right: w * 0.08),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.fillColor),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ThemeData().colorScheme.copyWith(
                            primary: Colors.black,
                          ),
                    ),
                    child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: ' EMAIL',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.05),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          labelStyle:
                              const TextStyle(color: AppColors.fillText),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w * 0.02),
                              borderSide: const BorderSide(color: Colors.grey)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email field cannnot be empty';
                          } else if (!GetUtils.isEmail(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        }),
                  ),
                ),
              ),

              SizedBox(height: h * 0.03),
              Padding(
                padding: EdgeInsets.only(left: w * 0.08, right: w * 0.08),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.fillColor),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ThemeData().colorScheme.copyWith(
                            primary: Colors.grey,
                          ),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: ' PASSWORD',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.05),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        labelStyle: const TextStyle(color: AppColors.fillText),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.02)),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      obscureText: obscureText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password field cannnot be empty';
                        } else if (value.length < 8) {
                          return 'Password should be up to 8 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: h * 0.03),
              Padding(
                padding: EdgeInsets.only(left: w * 0.08, right: w * 0.08),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.fillColor),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ThemeData().colorScheme.copyWith(
                            primary: Colors.grey,
                          ),
                    ),
                    child: TextFormField(
                      controller: confirmPSWDController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: ' CONFIRM PASSWORD',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.05),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        labelStyle: const TextStyle(color: AppColors.fillText),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.02)),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              ObscureTextPSWDConfirm = !ObscureTextPSWDConfirm;
                            });
                          },
                          child: Icon(
                            ObscureTextPSWDConfirm
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      obscureText: ObscureTextPSWDConfirm,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password field cannnot be empty';
                        } else if (value.length < 8) {
                          return 'Password should be up to 8 characters';
                        } else if (value != passwordController.text) {
                          return 'Password mismatch';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Checkbox(
              //         value: rememberMe,
              //         onChanged: (value) {
              //           setState(() {
              //             rememberMe = value!;
              //           });
              //         }),
              //     Text(
              //       'Remeber Me',
              //       style: GoogleFonts.poppins(fontSize: h * 0.02),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: h * 0.04,
              ),
              GestureDetector(
                onTap: () async {
                  if (regKey.currentState!.validate()) {
                    authController.signUpUser(
                      email: emailController.text.trim(),
                      userName: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      referralCode: 'string',
                    );
                  }
                },
                child: Obx(() {
                  return CustomButton(
                    height: h * 0.08,
                    width: w * 0.8,
                    color: AppColors.primaryColor,
                    text: authController.isLoading.value
                        ? 'loading . . .'
                        : 'Sign Up',
                    circularRadius: 50,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x54000000),
                        offset: Offset(0, 4),
                        blurRadius: 3,
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Text(
                'OR',
                style: GoogleFonts.poppins(fontSize: h * 0.02),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.01),
                    child: Image.asset('assets/icons/search.png'),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Image.asset(
                    'assets/icons/apple-logo.png',
                    scale: h * 0.001,
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: GoogleFonts.poppins(),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAllNamed('/login'),
                    child: Text(
                      ' Sign in',
                      style: GoogleFonts.poppins(color: Colors.blue),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

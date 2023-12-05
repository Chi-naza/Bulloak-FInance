import 'package:bulloak_fin_mgt_fin_mgt/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';
import '../../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<LoginScreen> {
  final loginKey = GlobalKey<FormState>();

  // auth controller
  var authController = Get.find<AuthController>();

  // text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  String password = '';
  bool obscureText = true;

  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
        child: Center(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: h * 0.1),
              child: Text(
                'Log In To Your Account',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: h * 0.025),
                ),
              ),
            ),
            SizedBox(height: h * 0.03),
            //////
            Form(
              key: loginKey,
              child: Column(
                children: [
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
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                          validator: (value) {
                            if (!GetUtils.isEmail(value!)) {
                              return 'Invalid email';
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
                            labelStyle:
                                const TextStyle(color: AppColors.fillText),
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
                            if (value!.isEmpty) {
                              return 'Password field cannnot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: h * 0.03),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    }),
                Text(
                  'Remeber Me',
                  style: GoogleFonts.poppins(fontSize: h * 0.02),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            GestureDetector(
              onTap: () {
                if (loginKey.currentState!.validate()) {
                  authController.signInUser(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    rememberMe: rememberMe,
                  );
                }
              },
              child: Obx(() {
                return CustomButton(
                  height: h * 0.08,
                  width: w * 0.8,
                  text: authController.isLoading.value
                      ? 'loading . . .'
                      : 'Login',
                  color: AppColors.primaryColor,
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
            GestureDetector(
              onTap: () => Get.toNamed('/forgotpswd'),
              child: Text(
                'Forgot Password?',
                style:
                    GoogleFonts.poppins(fontSize: h * 0.02, color: Colors.blue),
              ),
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
                  'Don\'t have an account? ',
                  style: GoogleFonts.poppins(),
                ),
                GestureDetector(
                  onTap: () => Get.offAllNamed('/signup'),
                  child: Text(
                    ' Sign Up',
                    style: GoogleFonts.poppins(color: Colors.blue),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

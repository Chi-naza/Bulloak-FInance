import 'package:bulloak_fin_mgt_fin_mgt/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors.dart';
import '../../../widgets/custom_button.dart';

class ResetPSWD extends StatefulWidget {
  const ResetPSWD({super.key});

  @override
  State<ResetPSWD> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<ResetPSWD> {
  var otpController = TextEditingController();
  var passwordController = TextEditingController();

  String password = '';
  bool obscureText = true;

  var authController = Get.find<AuthController>();

  var formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    otpController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Create New Password',
              style: GoogleFonts.poppins(),
            ),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new),
            )),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Image.asset('assets/images/newpswd.png'),
              Padding(
                padding: EdgeInsets.only(right: w * 0.27, top: h * 0.05),
                child: Text(
                  'Create your new password',
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
              //////
              SizedBox(height: h * 0.03),
              Form(
                key: formkey,
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
                            style: const TextStyle(color: Colors.black),
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.numbers,
                                color: AppColors.fillText,
                              ),
                              hintText: ' Verification Code',
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
                                  borderRadius:
                                      BorderRadius.circular(w * 0.02)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Otp field cannnot be empty';
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
                            style: const TextStyle(color: Colors.black),
                            controller: passwordController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: AppColors.fillText,
                              ),
                              hintText: ' New Password',
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
                                  borderRadius:
                                      BorderRadius.circular(w * 0.02)),
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

              SizedBox(
                height: h * 0.08,
              ),
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      // complete reset
                      authController.completePswdReset(
                        newPswd: passwordController.text.trim(),
                        otp: otpController.text.trim(),
                      );
                    }
                  },
                  child: CustomButton(
                    height: h * 0.08,
                    width: w * 0.8,
                    text: authController.isLoading.value
                        ? 'processing . . .'
                        : 'Continue',
                    color: AppColors.primaryColor,
                    circularRadius: 50,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x54000000),
                        offset: Offset(0, 4),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                );
              }),
            ]),
          ),
        ),
      ),
    );
  }
}

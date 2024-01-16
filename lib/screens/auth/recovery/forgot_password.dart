import 'package:bulloak_fin_mgt_fin_mgt/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors.dart';
import '../../../widgets/custom_button.dart';

class ForgotPSWD extends StatefulWidget {
  const ForgotPSWD({super.key});

  @override
  State<ForgotPSWD> createState() => _ForgotPSWDState();
}

class _ForgotPSWDState extends State<ForgotPSWD> {
  var emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var authController = Get.find<AuthController>();

  @override
  void initState() {
    emailController.text = "chinaza@gmail.com";
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios_new)),
            title: Text(
              'Forgot Password',
              style: GoogleFonts.poppins(),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/fgpswd.png'),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Text(
                      'Select which contact details we should use to reset your password',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: h * 0.03),
                    height: h * 0.13,
                    width: w * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            width: 3, color: AppColors.primaryColor)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset('assets/icons/email.png'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'via Email',
                              style: GoogleFonts.poppins(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: h * 0.005,
                            ),
                            Container(
                              width: w * 0.63,
                              child: Text(
                                emailController.text, // Your email,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.005,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: h * 0.03),
                    height: h * 0.13,
                    width: w * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            width: 1, color: AppColors.secondaryColor)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset('assets/icons/sms.png'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'via SMS',
                              style: GoogleFonts.poppins(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: h * 0.005,
                            ),
                            Text(
                              '+2341234567890',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
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
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              hintText: ' Put Your Email Here',
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
                                borderSide:
                                    const BorderSide(color: Colors.grey),
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
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        authController
                            .startPasswordReset(emailController.text.trim());
                      }
                    },
                    child: Obx(() {
                      return CustomButton(
                        height: h * 0.08,
                        width: w * 0.85,
                        text: authController.isLoading.value
                            ? 'sending . . .'
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
                      );
                    }),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  )
                ],
              ),
            ),
          )),
    );
  }
}

import 'package:bulloak_fin_mgt_fin_mgt/controllers/auth_controller.dart';
import 'package:bulloak_fin_mgt_fin_mgt/screens/auth/recovery/resetPSWD.dart';
import 'package:bulloak_fin_mgt_fin_mgt/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../colors.dart';
import '../../widgets/custom_button.dart';

class OTPVerification extends StatefulWidget {
  final String email;

  const OTPVerification({super.key, required this.email});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  // auth controller
  var authController = Get.find<AuthController>();

  // Controller
  CountdownController _timerController = CountdownController(autoStart: true);

  bool isTimerEnded = false;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    String otpGotten = '';

    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'OTP Code Verification',
              style: GoogleFonts.poppins(),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: h * 0.1),
                  child: Text(
                    'Code has been sent to your email',
                    style: GoogleFonts.poppins(
                        fontSize: w * 0.037,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.8)),
                  ),
                ),
                SizedBox(height: h * 0.04),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.03, vertical: h * 0.05),
                  child: PinCodeTextField(
                    keyboardType: TextInputType.number,
                    appContext: context,
                    length: 6,
                    onCompleted: (value) {
                      setState(() {
                        otpGotten = value;
                      });
                      authController.verifyAccount(otpGotten);
                      debugPrint("OTP - Submitted: $otpGotten");
                    },
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      activeFillColor: AppColors.secondaryColor,
                      fieldWidth: w * 0.15,
                      selectedFillColor: AppColors.fillColor,
                      inactiveFillColor: AppColors.fillColor,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(15),
                      fieldHeight: 50,
                      inactiveColor: AppColors.secondaryColor,
                      activeColor: Colors.orange,
                      selectedColor: Colors.brown,
                    ),
                  ),
                ),
                Countdown(
                  controller: _timerController,
                  seconds: 30,
                  build: (_, double time) => Text(
                    "Resend code in $time",
                    style: TextStyle(
                      fontSize: w * 0.037,
                    ),
                  ),
                  interval: const Duration(seconds: 1),
                  onFinished: () {
                    setState(() {
                      isTimerEnded = true;
                    });
                  },
                ),
                // Text(
                //   'Resend code in ${resendTime}s',
                //   style: GoogleFonts.poppins(
                //       fontSize: w * 0.037,
                //       fontWeight: FontWeight.w500,
                //       color: Colors.black.withOpacity(0.8)),
                // ),
                if (isTimerEnded)
                  Container(
                    margin: EdgeInsets.only(top: h * 0.2),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isTimerEnded = false;
                        });
                        authController.resendVerificationOtp(widget.email);
                        _timerController.restart();
                      },
                      child: CustomButton(
                        height: h * 0.08,
                        width: w * 0.8,
                        color: AppColors.primaryColor,
                        text: 'Resend',
                        circularRadius: 50,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x54000000),
                            offset: Offset(0, 4),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                Container(
                  margin: EdgeInsets.only(top: h * 0.04),
                  child: GestureDetector(
                    onTap: () {
                      if (otpGotten.isNotEmpty) {
                        authController.verifyAccount(otpGotten);
                      } else {
                        bulloakSnackbar(isError: true, message: 'Input otp');
                      }
                    },
                    child: Obx(() {
                      return CustomButton(
                        height: h * 0.08,
                        width: w * 0.8,
                        color: AppColors.primaryColor,
                        text: authController.isLoading.value
                            ? 'verifying . . .'
                            : 'Verify',
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
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  onCompleted(value) {
    if (value = true) {
      Get.to(() => const ResetPSWD());
    } else {
      print('incorrect details');
    }
  }
}

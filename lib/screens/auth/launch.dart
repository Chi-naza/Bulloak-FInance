import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../colors.dart';
import '../../widgets/custom_button.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: EdgeInsets.only(top: h * 0.3, bottom: h * 0.15),
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(100)),
            child: Center(child: Image.asset('assets/images/bulloaklogo.png')),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Get.toNamed('/login');
        },
        child: CustomButton(
          height: h * 0.08,
          width: w * 0.8,
          color: AppColors.primaryColor,
          text: 'Login',
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
      SizedBox(
        height: h * 0.02,
      ),
      GestureDetector(
        onTap: () {
          Get.toNamed('/signup');
        },
        child: CustomButton(
          height: h * 0.08,
          width: w * 0.8,
          text: 'Sign Up',
          circularRadius: 50,
          color: AppColors.primaryColor,
          boxShadow: const [
            BoxShadow(
              color: Color(0x54000000),
              offset: Offset(0, 4),
              blurRadius: 3,
            ),
          ],
        ),
      ),
    ]));
  }
}

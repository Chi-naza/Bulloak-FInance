import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.circularRadius,
      this.fontWeight,
      this.icon,
      this.color,
      this.boxShadow,
      this.fontSize,
      this.textColor,
      this.child});

  final double height;
  final double width;
  final String text;
  final double circularRadius;
  final List<BoxShadow>? boxShadow;
  final Widget? icon;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(circularRadius),
        boxShadow: boxShadow,
      ),
      child: child ??
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Center(child: icon),
                ),
                Text(
                  text,
                  style: GoogleFonts.poppins(
                      fontSize: fontSize ?? w * 0.05,
                      // fontSize: w * 0.05,
                      color: textColor ?? Colors.white,
                      // color: Colors.white,
                      fontWeight: fontWeight ?? FontWeight.bold),
                ),
              ],
            ),
          ),
    );
  }
}

//////////////////

class ReferralCateg extends StatelessWidget {
  final String earnAmount;
  const ReferralCateg({super.key, required this.earnAmount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Container(
        height: 30.h,
        width: 60.w,
        decoration: BoxDecoration(
            color: const Color(0xffFFB803),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            earnAmount,
            style: GoogleFonts.poppins(
                color: const Color(0xff41073F),
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

///////////////////
class BoxWithIcon extends StatelessWidget {
  final IconData icon;
  const BoxWithIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.sp,
      width: 50.sp,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.fillText, width: 0.5)),
      child: Icon(
        icon,
        color: AppColors.primaryColor,
        size: 35.sp,
      ),
    );
  }
}

class WriteUps extends StatelessWidget {
  final String text;
  const WriteUps({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 80,
      child: Text(
        text,
        style: GoogleFonts.poppins(
            color: AppColors.primaryColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

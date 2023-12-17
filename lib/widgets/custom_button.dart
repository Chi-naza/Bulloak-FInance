import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      this.textColor});

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
      child: Center(
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

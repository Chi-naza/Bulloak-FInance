import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AssetInfo extends StatelessWidget {
  const AssetInfo({
    super.key,
    required this.category,
    required this.amount,
  });

  final String category;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 79.sp,
      width: 150,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style:
                GoogleFonts.poppins(color: Colors.grey[800], fontSize: 13.5.sp),
          ),
          Text(
            amount,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, fontSize: 23.sp),
          ),
        ],
      )),
    );
  }
}

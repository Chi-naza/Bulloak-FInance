import 'package:bulloak_fin_mgt_fin_mgt/colors.dart';
import 'package:bulloak_fin_mgt_fin_mgt/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalAssets extends StatelessWidget {
  TotalAssets({super.key});

  var yesterday = "+0.00";

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
          title: Text('Total Assets', style: GoogleFonts.poppins()),
        ),
        body: Container(
          height: 450.h,
          width: w,
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 12,
                  spreadRadius: 1),
            ],
          ),
          child: Column(///////////////////////////////
              children: [
            Text(
              'Total Assets (NGN)',
              style: GoogleFonts.poppins(
                  fontSize: 15.sp, color: AppColors.fillText),
            ),
            Text(
              '900,000.00',
              style: GoogleFonts.poppins(
                  fontSize: 23.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700),
            ),
            CustomButton(
              height: 30,
              width: w * 0.5,
              text: 'Yesterday\'s income $yesterday',
              circularRadius: 50,
              fontSize: 12.5.sp,
              color: AppColors.secondaryColor.withOpacity(0.3),
              textColor: AppColors.primaryColor.withOpacity(0.8),
            )
          ]),
        ),
      ),
    );
  }
}

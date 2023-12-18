import 'package:bulloak_fin_mgt_fin_mgt/colors.dart';
import 'package:bulloak_fin_mgt_fin_mgt/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/asset_info.dart';

class TotalAssets extends StatelessWidget {
  const TotalAssets({super.key});

  final String yesterday = "+100000.00";

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
          height: 500.h,
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
          child: Stack(children: [
            Column(
                ///////////////////////////////
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Text(
                      'Total Assets (NGN)',
                      style: GoogleFonts.poppins(
                          fontSize: 15.sp, color: Colors.grey[800]),
                    ),
                  ),
                  Text(
                    '900,000.00',
                    style: GoogleFonts.poppins(
                        fontSize: 25.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                  CustomButton(
                    height: 35,
                    width: 250.w,
                    text: 'Yesterday\'s income: $yesterday',
                    circularRadius: 50,
                    fontSize: 12.5.sp,
                    color: AppColors.secondaryColor.withOpacity(0.3),
                    textColor: AppColors.primaryColor.withOpacity(0.8),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AssetInfo(category: 'Balance (NGN)', amount: '0.00'),
                      AssetInfo(category: 'Target (NGN)', amount: '0.00'),
                    ],
                  ),
                  Divider(
                      color: AppColors.fillText.withOpacity(0.5),
                      indent: 35.w,
                      endIndent: 35.w),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AssetInfo(category: 'Fixed (NGN)', amount: '0.00'),
                      AssetInfo(category: 'SafeBox (NGN)', amount: '0.00'),
                    ],
                  ),
                  Divider(
                      color: AppColors.fillText.withOpacity(0.5),
                      indent: 35.w,
                      endIndent: 35.w),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AssetInfo(
                          category: 'Spend & Save (NGN)', amount: '   0.00'),
                      AssetInfo(category: 'OWealth (NGN)', amount: '0.00'),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  )
                ]),
            Center(
              child: VerticalDivider(
                color: AppColors.fillText.withOpacity(0.5),
                indent: 150,
                endIndent: 30,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

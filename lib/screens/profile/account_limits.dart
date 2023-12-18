import 'package:bulloak_fin_mgt_fin_mgt/colors.dart';
import 'package:bulloak_fin_mgt_fin_mgt/data/account_limits.dart';
import 'package:bulloak_fin_mgt_fin_mgt/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountLimits extends StatelessWidget {
  const AccountLimits({super.key});

  final int tier = 2;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
          title: Text(
            'Account Limits',
            style: GoogleFonts.poppins(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 200.h,
              width: w,
              margin: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 12,
                      spreadRadius: 5),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //row 1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tier',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          Text(
                            tier.toString(),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 14),
                          )
                        ],
                      ),
                      //row 2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Name',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            'Omeje Faith Sky'.toUpperCase(),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 18),
                          )
                        ],
                      ),
                      //row 3
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            'faith@gmail.com',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 14),
                          )
                        ],
                      ),
                      //row 4
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date of birth',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            '23/5/2001',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 14),
                          )
                        ],
                      ),
                      //row 5
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Address',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            '*******',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ]),
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 420.h,
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                        height: 110.h,
                        width: w,
                        margin: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                spreadRadius: 5),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: GoogleFonts.poppins(
                                              color: Colors.black),
                                          children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              '${accountLimits[index]['tier']}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        TextSpan(
                                            text:
                                                '    ${accountLimits[index]['currentLimit'] ?? ' '}',
                                            style: GoogleFonts.poppins(
                                                fontSize: 15.sp)),
                                      ])),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Daily Transaction Limit',
                                            style: GoogleFonts.poppins(
                                                color: Colors.black)),
                                        Text(
                                          accountLimits[index]['limit'],
                                          style: GoogleFonts.poppins(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primaryColor),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Maximum Account Balance',
                                            style: GoogleFonts.poppins(
                                                color: Colors.black)),
                                        Text(
                                          accountLimits[index]['balance'],
                                          style: GoogleFonts.poppins(
                                              fontSize: 16.sp,
                                              color: AppColors.primaryColor),
                                        )
                                      ],
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, int index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                  itemCount: accountLimits.length),
            ),
            SizedBox(height: 8.h),
            CustomButton(
              height: h * 0.07,
              width: w * 0.8,
              color: AppColors.primaryColor,
              text: 'Upgrade',
              fontWeight: FontWeight.normal,
              circularRadius: 10,
            ),
          ]),
        ),
      ),
    );
  }
}

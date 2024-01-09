import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/referral_data.dart';

class InviteFriends extends StatelessWidget {
  const InviteFriends({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff41073F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text('Refer', style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            children: [
              Text(
                'Your referral code',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              SizedBox(height: 10.h),
              Text(
                'FAOM1189',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Referred users',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              SizedBox(height: 10.h),
              Text(
                '0',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 250.h,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: referralData.length,
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white)),
                    child:
                        Center(child: Image.asset(referralData[index]['icon'])),
                  ),
                  SizedBox(
                    width: 270,
                    child: Text(
                      referralData[index]['text'],
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  )
                ],
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 20,
              ),
            ),
          ),
          Container(
            height: 50,
            width: w * 0.8,
            decoration: BoxDecoration(
                color: const Color(0xffFFB803),
                borderRadius: BorderRadius.circular(10)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/icons/share.png',
                scale: 0.8,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text('Share your code',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400))
            ]),
          ),
          SizedBox(
            height: 185.h,
          )
        ]),
      ),
    ));
  }
}

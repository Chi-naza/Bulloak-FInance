import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  child: Image.asset(
                      'assets/images/user.png'), //user's profile pic
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Omeje Sky',
                style: GoogleFonts.poppins(
                    fontSize: 17.sp,
                    color: const Color(0xff41073f),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Marketing Manager',
                style:
                    GoogleFonts.poppins(color: Colors.black, fontSize: 13.sp),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/icons/facebook.png', scale: 1.1),
                    Image.asset('assets/icons/instagram.png', scale: 1.1),
                    Image.asset('assets/icons/twitter.png', scale: 1.1),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 315.h,
                width: w,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Name',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sky Omeje',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                            const EditProfileButton()
                          ],
                        ), ///////////////////////
                        const SizedBox(height: 15),
                        Text(
                          'Email',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'bluesky@gmail.com',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                            const EditProfileButton()
                          ],
                        ), ///////////////////////
                        const SizedBox(height: 15),
                        Text(
                          'Phone Number',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '+2348080976555',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                            const EditProfileButton()
                          ],
                        ), ///////////////////////
                        const SizedBox(height: 15),
                        Text(
                          'Address',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '17 Pound Road, Aba',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                            const EditProfileButton()
                          ],
                        ),
                      ]),
                ),
              ),
              const SizedBox(height: 20),

              // 0
              GestureDetector(
                onTap: () => Get.toNamed('/totalAssets'),
                child: Container(
                  height: 50.h,
                  width: w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Assets',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'View your total assets and earnings',
                            style: GoogleFonts.poppins(),
                          )
                        ]),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // 1
              GestureDetector(
                onTap: () => Get.toNamed('/transactionHistory'),
                child: Container(
                  height: 50.h,
                  width: w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Transaction History',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // 2
              GestureDetector(
                onTap: () => Get.toNamed('/accountLimits'),
                child: Container(
                  height: 50.h,
                  width: w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Account Limits',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'View your account limits',
                            style: GoogleFonts.poppins(),
                          )
                        ]),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // 3
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50.h,
                  width: w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Support',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ));
  }
}

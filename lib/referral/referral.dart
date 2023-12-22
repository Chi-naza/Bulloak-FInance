import 'package:bulloak_fin_mgt_fin_mgt/colors.dart';
import 'package:bulloak_fin_mgt_fin_mgt/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Referral extends StatelessWidget {
  const Referral({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title:
            Text('Referral', style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
              //ads
              children: [
                Image.asset('assets/images/adBox.png'),
                Positioned(
                    left: 40.w,
                    top: 15.h,
                    child: SizedBox(
                      height: 300,
                      width: 320,
                      child: Image.asset(
                          'assets/images/ad.png'), //advertisement image
                    ))
              ]),
          ////////////
          Container(
            height: 80.h,
            width: w * 0.85,
            decoration: BoxDecoration(
                color: const Color(0xff41073F),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              /////////////////////////////////////////
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: 10.h,
                      width: 38.w,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 184, 3),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5)))),
                  const ReferralCateg(earnAmount: '\$20.00'),
                  Container(
                      height: 10.h,
                      width: 38.w,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(61, 255, 184, 3),
                      )),
                  const ReferralCateg(earnAmount: '\$40.00'),
                  Container(
                      height: 10.h,
                      width: 38.w,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(61, 255, 184, 3),
                      )),
                  const ReferralCateg(
                    earnAmount: '\$60.00',
                  ),
                ]),
                Row(children: [
                  SizedBox(
                    height: 15.h,
                    width: 75.w,
                  ),
                  Text(
                    '1 User',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                    width: 54.w,
                  ),
                  Text(
                    '2 Users',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                    width: 42.w,
                  ),
                  Text(
                    '3 Users',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 14.sp),
                  ),
                ])
              ],
            ),
          ),
          SizedBox(height: 25.h),
          ////////////////
          GestureDetector(
            onTap: () => Get.toNamed('/inviteFriends'),
            child: CustomButton(
                height: 55.h,
                width: w * 0.8,
                text: 'Invite Now',
                textColor: Colors.black,
                color: const Color(0xffFFB803),
                circularRadius: 10,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 30.h),
          Container(
              height: 200,
              width: w * 0.87.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      Text(
                        'How do you get?',
                        style: GoogleFonts.poppins(color: Colors.grey[800]),
                      ),
                      SizedBox(height: 5.h),
                      Divider(
                          color: AppColors.fillText.withOpacity(0.4),
                          indent: 40.w,
                          endIndent: 40.w,
                          height: 0)
                    ]),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const BoxWithIcon(icon: Icons.share_outlined),
                                SizedBox(height: 5.h),
                                const WriteUps(
                                    text: 'Share your invitation code/link')
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const BoxWithIcon(icon: Iconsax.login),
                                SizedBox(height: 5.h),
                                const WriteUps(
                                    text:
                                        'Friends sign in with your invitation codes')
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const BoxWithIcon(
                                    icon: Iconsax.arrow_swap_horizontal),
                                SizedBox(height: 5.h),
                                const WriteUps(
                                    text: 'Friends make the first transaction')
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ])),
          const SizedBox(height: 10)
        ]),
      ),
    ));
  }
}

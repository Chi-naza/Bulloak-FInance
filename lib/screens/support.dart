import 'package:bulloak_fin_mgt_fin_mgt/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text('Bulloak Support',
            style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: Column(children: [
        Stack(children: [
          Image.asset('assets/images/ads.png'),
          Positioned(
              left: 48.w,
              top: 40.h,
              child: SizedBox(
                height: 250,
                width: 300,
                child: Image.asset(
                    'assets/images/fgpswd.png'), //advertisement image
              ))
        ]),
        Image.asset(
          'assets/images/support.png',
        ),
        const SizedBox(height: 40),
        Container(
          height: 200,
          width: w * 0.87.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Iconsax.message_24),
                          Text(
                            ' Email:',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Text(
                        '           @support.com',
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Iconsax.call),
                          Text(
                            ' Call Us:',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Text(
                        '           +234813444777',
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Iconsax.message),
                          Text(
                            ' Message Us:',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Text(
                        '+234813444777',
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ]),
          ),
        )
      ]),
    ));
  }
}

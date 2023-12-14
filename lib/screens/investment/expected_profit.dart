import 'package:bulloak_fin_mgt_fin_mgt/colors.dart';
import 'package:bulloak_fin_mgt_fin_mgt/data/expected_profit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ExpectedProfit extends StatelessWidget {
  const ExpectedProfit({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 300.h,
              width: w,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: const BoxDecoration(color: Color(0xff41073f)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () => Get.back(),
                              child: const Icon(Icons.arrow_back_ios,
                                  color: Colors.white)),
                          CircleAvatar(
                            radius: 25.w,
                            child: Image.asset(
                                'assets/images/user.png'), //user's profile pic
                          ),
                        ]),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Balance',
                                style:
                                    GoogleFonts.poppins(color: Colors.white)),
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('50,000.00',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 35.w,
                                      fontWeight: FontWeight.w400)),
                              Container(
                                height: 40.w,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(1000)),
                                child: const Icon(Icons.add,
                                    color: Color(0xff41073f)),
                              )
                            ]),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 80.h,
                            width: 180.w,
                            color: AppColors.primaryColor.withOpacity(0.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Iconsax.wallet_1,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Currency',
                                        style: GoogleFonts.poppins(
                                            letterSpacing: 1,
                                            color: Colors.white)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text('\$200.32',
                                        style: GoogleFonts.poppins(
                                            fontSize: 18, color: Colors.white))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 80.h,
                            width: 180.w,
                            color: AppColors.primaryColor.withOpacity(0.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Iconsax.chart_2,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Shares',
                                        style: GoogleFonts.poppins(
                                            letterSpacing: 1,
                                            color: Colors.white)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text('\$15,000.32',
                                        style: GoogleFonts.poppins(
                                            fontSize: 18, color: Colors.white))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ])
                  ]),
            ),
            Expanded(
              child: SizedBox(
                width: w,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: ListView.separated(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 70,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/packages/forex.png')),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        expProfit[index]['name'],
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff41073f)),
                                      ),
                                      Text(
                                        '\$30.00',
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        'Return: 0.34%',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

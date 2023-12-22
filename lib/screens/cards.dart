import 'package:bulloak_fin_mgt_fin_mgt/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../colors.dart';
import '../data/cardscreeninfo.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back_ios,
                )),
            title: const Text('Cards'),
            flexibleSpace: Container(),
            bottom: TabBar(tabs: [
              Tab(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("Physical Card",
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500)))),
              Tab(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("Virtual Card",
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500))))
            ])),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/samplecard.png'),
                SizedBox(
                  height: 300.h,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color:
                                    AppColors.secondaryColor.withOpacity(0.5)),
                            child: Center(
                                child: Image(
                                    image: AssetImage(
                                        cardScreenInfo[index]['icon']))),
                          ),
                          title: Text(
                            cardScreenInfo[index]['title'],
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            cardScreenInfo[index]['sub'],
                            style: GoogleFonts.poppins(),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10.h,
                        );
                      },
                      itemCount: cardScreenInfo.length),
                ),
                Container(
                  height: 150.h,
                  width: w,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 10)
                  ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        height: h * 0.06,
                        width: w * 0.8,
                        color: AppColors.primaryColor,
                        text: 'Home delivery',
                        fontWeight: FontWeight.normal,
                        circularRadius: 10,
                        fontSize: 15,
                      ),
                      Container(
                        height: h * 0.06,
                        width: w * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2, color: AppColors.primaryColor)),
                        child: Center(
                          child: Text(
                            'Pick up from nearby merchant',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ), ///////////////////////
          Column(
            children: [
              SizedBox(
                height: 30.h,
                width: w,
              )
            ],
          ),
        ]),
      ),
    ));
  }
}

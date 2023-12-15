import 'package:bulloak_fin_mgt_fin_mgt/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                color: Colors.white,
              )),
          title: const Text('Cards'),
          flexibleSpace: Container(),
          bottom: TabBar(tabs: [
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Physical Card",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Virtual Card",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ]),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CreditCardWidget(
                  glassmorphismConfig: Glassmorphism.defaultConfig(),
                  cardNumber: '',
                  expiryDate: '',
                  cardHolderName: '',
                  cvvCode: '123',
                  bankName: 'User\'s Bank',
                  textStyle: GoogleFonts.poppins(color: Colors.white),
                  frontCardBorder: Border.all(color: Colors.grey),
                  backCardBorder: Border.all(color: Colors.grey),
                  showBackView: true,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  cardBgColor: Colors.black,
                  backgroundImage: 'assets/images/card_bg.png',
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange:
                      (CreditCardBrand creditCardBrand) {},
                  customCardTypeIcons: <CustomCardTypeIcon>[
                    CustomCardTypeIcon(
                      cardType: CardType.mastercard,
                      cardImage: Image.asset(
                        'assets/images/mastercard.png',
                        height: 48,
                        width: 48,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 340.h,
                  child: ListView.separated(
                    itemCount: cardScreenInfo.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: AppColors.secondaryColor.withOpacity(0.5)),
                          child: Center(
                              child: Image(
                                  image: AssetImage(
                                      cardScreenInfo[index]['icon']))),
                        ),
                        title: Text(
                          cardScreenInfo[index]['title'],
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          cardScreenInfo[index]['sub'],
                          style: GoogleFonts.poppins(),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 25.h,
                      );
                    },
                  ),
                ),
                CustomButton(
                  height: h * 0.06,
                  width: w * 0.7,
                  color: AppColors.primaryColor,
                  text: 'Get It Now',
                  fontWeight: FontWeight.normal,
                  circularRadius: 10,
                ),
                SizedBox(
                  height: 30.h,
                  width: w,
                )
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
          )
        ]),
      ),
    ));
  }
}

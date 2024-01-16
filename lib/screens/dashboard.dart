import 'dart:math';
import 'package:bulloak_fin_mgt_fin_mgt/controllers/dashboard_controller.dart';
import 'package:bulloak_fin_mgt_fin_mgt/controllers/plan_controller.dart';
import 'package:bulloak_fin_mgt_fin_mgt/controllers/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';
import '../widgets/categories_column.dart';
import '../widgets/chart_view.dart';
import '../widgets/custom_button.dart';
import '../widgets/maindrawer.dart';
import 'transactions/deposit.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DashBoard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _advancedDrawerController = AdvancedDrawerController();
  bool customIcon = false;

  final List<Color> colors = <Color>[
    AppColors.secondaryColor,
    const Color(0xffFF03A9).withOpacity(0.5),
  ];

  var txnController = Get.find<TransactionController>();
  var dashController = Get.find<DashboardController>();

  @override
  void initState() {
    dashController.getUserDashboardDetail();
    txnController.fetchWithdrawalHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var user = dashController.userDashboardInfo.value;

    //deposit and withdrawal buttons decoration
    final kInnerDecoration = BoxDecoration(
      color: const Color(0xffFCEAFB),
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    );

    final kGradientBoxDecoration = BoxDecoration(
      gradient: const LinearGradient(
        colors: [AppColors.goldColor, AppColors.secondaryColor],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      border: Border.all(color: const Color(0xffFCEAFB), width: 0.05),
      borderRadius: BorderRadius.circular(10),
    );

    return AdvancedDrawer(
      backdropColor: AppColors.menuBgColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: const Offset(-20.0, 0.0),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      drawer: MainDrawer(w: w),
      ////////////
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        margin: EdgeInsets.only(top: h * 0.05),
                        height: h * 0.25,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        ///////////
                      ),
                      Positioned(
                        top: h * 0.025,
                        left: w * 0.04,
                        child: Container(
                          margin: EdgeInsets.only(top: h * 0.05),
                          height: h * 0.3, width: w * 0.8,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.center,
                                  colors: [
                                    Colors.white60.withOpacity(0.3),
                                    Colors.white10,
                                  ]),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 2,
                                color: Colors.white30,
                              )),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.06, vertical: h * 0.015),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      //row 1
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'My Portfolio',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: w * 0.04,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Container(
                                            height: w * 0.1,
                                            width: w * 0.09,
                                            decoration: BoxDecoration(
                                              color: AppColors.secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                color: Colors.black,
                                                onPressed:
                                                    _handleMenuButtonPressed,
                                                icon: ValueListenableBuilder<
                                                    AdvancedDrawerValue>(
                                                  valueListenable:
                                                      _advancedDrawerController,
                                                  builder: (_, value, __) {
                                                    return AnimatedSwitcher(
                                                      duration: const Duration(
                                                          milliseconds: 250),
                                                      child: Icon(
                                                        value.visible
                                                            ? Icons.close
                                                            : Icons.more_vert,
                                                        key: ValueKey<bool>(
                                                            value.visible),
                                                        color: Colors.white,
                                                        size: 25,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      //row2
                                      SizedBox(
                                        height: h * 0.008,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '\$',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "${user.totalDeposits}", //'47,300.00',
                                            style: GoogleFonts.poppins(
                                              fontSize: w * 0.065,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      //row3
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            '\$',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(
                                            width: 1,
                                          ),
                                          Text(
                                            "${user.totalWithdrawals}", //'2,535.40',
                                            style: GoogleFonts.poppins(
                                              fontSize: w * 0.04,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: w * 0.03,
                                          ),
                                          Text(
                                            "${user.totalBonuses}%", //'5.7%',
                                            style: GoogleFonts.poppins(
                                              fontSize: w * 0.038,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ]),
                          ),
                          ///////////
                        ),
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Statistics',
                            style: GoogleFonts.poppins(
                                color: AppColors.primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Details >',
                            style: GoogleFonts.poppins(
                                color: AppColors.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        height: h * 0.2,
                        child: const Row(
                          children: [
                            Expanded(flex: 3, child: CategoriesColumn()),
                            Expanded(flex: 4, child: ChartView()),
                          ],
                        )),
                    SizedBox(height: h * 0.035), //boxes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(const Deposit()),
                          child: Container(
                            height: h * 0.06,
                            width: w * 0.35,
                            decoration: kGradientBoxDecoration,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                decoration: kInnerDecoration,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: w * 0.03),
                                      child: Text(
                                        "Deposit",
                                        style: GoogleFonts.poppins(
                                          fontSize: w * 0.04,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Image.asset('assets/icons/deposit.png')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed('/withdrawal'),
                          child: Container(
                            height: h * 0.06,
                            width: w * 0.35,
                            decoration: kGradientBoxDecoration,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                decoration: kInnerDecoration,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: w * 0.03),
                                      child: Text(
                                        "Withdraw",
                                        style: GoogleFonts.poppins(
                                            fontSize: w * 0.04,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    SizedBox(height: w * 0.1),
                                    Image.asset('assets/icons/withdrawal.png')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Investments',
                            style: GoogleFonts.poppins(
                                color: AppColors.primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Crypto',
                            style: GoogleFonts.poppins(
                                color: AppColors.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.5,
                      child: Obx(() {
                        return ListView.builder(
                            padding: EdgeInsets.only(top: h * 0.0001),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: txnController.withdrawalHistoryList
                                .length, // investments.length,
                            itemBuilder: (context, index) {
                              var withD =
                                  txnController.withdrawalHistoryList[index];

                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                height: h * 0.08,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '     ${withD.walletType}',
                                      style: GoogleFonts.poppins(
                                          fontSize: w * 0.04,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    //row with texts and a container
                                    Row(
                                      children: [
                                        //column of texts
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: h * 0.02),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text('${withD.amount} USD',
                                                  style: GoogleFonts.poppins()),
                                              Text('\$ ${withD.usdtAmount}',
                                                  style: GoogleFonts.poppins(
                                                      color: AppColors
                                                          .secondaryColor))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: h * 0.03, left: w * 0.06),
                                          height: h * 0.07,
                                          width: h * 0.07,
                                          decoration: BoxDecoration(
                                              color: Colors
                                                  .primaries[Random().nextInt(
                                                      Colors.primaries.length)]
                                                  .withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                              child: Text(
                                            '+7.3%',
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            });
                      }),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed('/invPlans'),
                      child: CustomButton(
                        height: h * 0.07,
                        width: w * 0.8,
                        color: AppColors.primaryColor,
                        icon: const Icon(
                          Icons.add,
                          weight: 70,
                          color: AppColors.primaryColor,
                        ),
                        text: '  Add Investment',
                        circularRadius: 10,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x54000000),
                            offset: Offset(0, 4),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: w * 0.1),
                  ],
                ),
              ),
            ),
          ),
          // bottomNavigationBar: BottomNavigation(),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}

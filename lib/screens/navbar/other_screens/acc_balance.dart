import 'package:bulloak_fin_mgt_fin_mgt/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/wallet_cards.dart';

class AccBal extends StatefulWidget {
  const AccBal({super.key});

  @override
  State<AccBal> createState() => _AccBalState();
}

class _AccBalState extends State<AccBal> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final _controller = PageController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$5623.67',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700, fontSize: w * 0.06),
                    ),
                    Text(
                      'December 29, 2023',
                      style: GoogleFonts.inter(
                          fontSize: w * 0.035,
                          color: Colors.black.withOpacity(0.6)),
                    ),
                    SizedBox(height: h * 0.03),
                    SizedBox(
                      height: h * 0.34,
                      width: w,
                      child: BarChart(BarChartData(
                          gridData: FlGridData(show: false),
                          borderData: FlBorderData(
                              show: false,
                              border: const Border(
                                top: BorderSide.none,
                                right: BorderSide.none,
                                left: BorderSide(width: 1),
                                bottom: BorderSide(width: 1),
                              )),
                          titlesData: FlTitlesData(
                            show: true,
                            topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: getBottomTitles,
                                    reservedSize: 30)),
                          ),
                          groupsSpace: 5,
                          barGroups: [
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                  borderRadius: BorderRadius.zero,
                                  toY: 6,
                                  fromY: 0,
                                  width: 45,
                                  color: AppColors.fillColor)
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                  borderRadius: BorderRadius.zero,
                                  toY: -1,
                                  fromY: 0,
                                  width: 45,
                                  color: AppColors.fillColor)
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(
                                  borderRadius: BorderRadius.zero,
                                  toY: 7,
                                  fromY: 0,
                                  width: 45,
                                  color: AppColors.primaryColor)
                            ]),
                            BarChartGroupData(x: 4, barRods: [
                              BarChartRodData(
                                  borderRadius: BorderRadius.zero,
                                  toY: 6,
                                  fromY: 0,
                                  width: 45,
                                  color: AppColors.fillColor)
                            ]),
                            BarChartGroupData(x: 5, barRods: [
                              BarChartRodData(
                                  borderRadius: BorderRadius.zero,
                                  toY: 5,
                                  fromY: 0,
                                  width: 45,
                                  color: AppColors.fillColor)
                            ]),
                          ])),
                    ),
                    SizedBox(height: h * 0.04),
                    Text(
                      'Account Reports',
                      style: GoogleFonts.inter(
                          fontSize: w * 0.04, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: cards.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                        child: Container(
                          height: h * 0.26,
                          width: w * 0.85,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x54000000),
                                offset: Offset(-1, 2),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: h * 0.025, horizontal: w * 0.04),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(cards[index]['month'],
                                          style: GoogleFonts.poppins(
                                            fontSize: w * 0.07,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.primaryColor,
                                          )),
                                      Container(
                                        height: w * 0.06,
                                        width: w * 0.06,
                                        decoration: BoxDecoration(
                                            color: AppColors.secondaryColor
                                                .withOpacity(0.6),
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: const Icon(
                                          Icons.more_horiz_rounded,
                                          color: AppColors.primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: h * 0.05),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Amount at start of month',
                                            style: GoogleFonts.poppins(
                                                fontSize: w * 0.026,
                                                letterSpacing: -0.2,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '\$2,043.33',
                                            style: GoogleFonts.poppins(
                                              fontSize: w * 0.05,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Amount at end of month',
                                            style: GoogleFonts.poppins(
                                                fontSize: w * 0.026,
                                                letterSpacing: -0.2,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '\$3,276.96',
                                            style: GoogleFonts.poppins(
                                              fontSize: w * 0.05,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: h * 0.02),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your balance grew by \$1231.82',
                                        style: GoogleFonts.poppins(
                                          fontSize: w * 0.035,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  var style = GoogleFonts.poppins(
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text('Aug\n2023', style: style);
    case 2:
      text = Text('Sept\n2023', style: style);
    case 3:
      text = Text('Oct\n2023', style: style);
    case 4:
      text = Text('Nov\n2023', style: style);
    case 5:
      text = Text('Dec\n2023', style: style);
    default:
      text = Text('', style: style);
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}

import 'package:bulloak_fin_mgt_fin_mgt/colors.dart';
import 'package:bulloak_fin_mgt_fin_mgt/controllers/plan_controller.dart';
import 'package:bulloak_fin_mgt_fin_mgt/models/plan_response_model.dart';
import 'package:bulloak_fin_mgt_fin_mgt/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/inv_plans.dart';

class InvestmentPlanWidget extends StatefulWidget {
  final int sweetIndex;
  final Plans realPlan;

  const InvestmentPlanWidget(
      {super.key, required this.sweetIndex, required this.realPlan});

  @override
  State<InvestmentPlanWidget> createState() => _InvestmentPlanWidgetState();
}

class _InvestmentPlanWidgetState extends State<InvestmentPlanWidget> {
  _InvestmentPlanWidgetState() {
    _selectedDuration = _selectDuration[0];
  }
  final _selectDuration = ['1 Week', '2 Weeks', '3 Weeks', '1 Month'];

  String? _selectedDuration = 'All Categories';

  var planController = Get.find<PlanController>();

  TextEditingController enterAmountController = TextEditingController();

  @override
  void dispose() {
    enterAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.01),
      child: Center(
        child: Stack(children: [
          Image.asset(plans[widget.sweetIndex]['image']),
          Positioned(
              top: h * 0.0135,
              right: w * 0.05,
              child: Image.asset(plans[widget.sweetIndex]['topbar'])),
          Positioned(
              top: h * 0.025,
              right: w * 0.08,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '`${widget.realPlan.name}'.toUpperCase(),
                    style: GoogleFonts.poppins(
                        fontSize: w * 0.038, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${widget.realPlan.investmentProfitPercent}% ROI", //plans[index]['ROI'],
                      style: GoogleFonts.poppins(
                        fontSize: w * 0.038,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                          style: GoogleFonts.poppins(color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text: '\$${widget.realPlan.minimumAmount}    '),
                        TextSpan(
                            text: 'Minimum',
                            style: GoogleFonts.poppins(color: Colors.red)),
                      ])),
                  RichText(
                      text: TextSpan(
                          style: GoogleFonts.poppins(color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text: '\$${widget.realPlan.maximumAmount}    '),
                        TextSpan(
                            text: 'Maximum',
                            style: GoogleFonts.poppins(color: Colors.red)),
                      ])),
                  SizedBox(height: h * 0.025),
                  Text(
                    'Select Duration                                           ',
                    style: GoogleFonts.poppins(
                        fontSize: w * 0.035, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 50,
                    width: w * 0.56,
                    child: DropdownButtonFormField(
                      iconDisabledColor: Colors.grey[700],
                      iconEnabledColor: Colors.grey[700],
                      value: _selectedDuration,
                      items: _selectDuration
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: GoogleFonts.poppins(
                                    color: Colors.grey[700], fontSize: 15),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedDuration = value as String;
                        });
                      },
                      decoration: const InputDecoration(fillColor: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: h * 0.06,
                    width: w * 0.55,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Amount:',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.04,
                          width: w * 0.25,
                          child: TextField(
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            controller: enterAmountController,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.grey,
                            cursorHeight: h * 0.035,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'Enter Amount',
                              labelStyle: GoogleFonts.poppins(
                                  color: AppColors.fillText, fontSize: 12),
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: h * 0.02),
                  Stack(children: [
                    Obx(() {
                      return planController.isLoading.value
                          ? Container()
                          : Image.asset(plans[widget.sweetIndex]['button']);
                    }),
                    Positioned(
                      top: h * 0.01,
                      left: w * 0.11,
                      child: GestureDetector(
                        onTap: () async {
                          if (enterAmountController.text.isEmpty) {
                            bulloakSnackbar(
                              isError: true,
                              message: 'Enter an amount to continue',
                            );
                          } else {
                            await planController.subscribeToAPlan(
                              amount:
                                  int.parse(enterAmountController.text.trim()),
                              planName: widget.realPlan.name!,
                            );
                            enterAmountController.clear();
                          }
                        },
                        child: Text(
                          'PROCEED',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: w * 0.03,
                          ),
                        ),
                      ),
                    )
                  ])
                ],
              ))
        ]),
      ),
    );
  }
}

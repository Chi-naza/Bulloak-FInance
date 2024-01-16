import 'package:bulloak_fin_mgt_fin_mgt/colors.dart';
import 'package:bulloak_fin_mgt_fin_mgt/controllers/plan_controller.dart';
import 'package:bulloak_fin_mgt_fin_mgt/widgets/custom_snackbar.dart';
import 'package:bulloak_fin_mgt_fin_mgt/widgets/investment_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/inv_plans.dart';

class InvestmentPlans extends StatefulWidget {
  const InvestmentPlans({super.key});

  @override
  State<InvestmentPlans> createState() => _InvestmentPlansState();
}

class _InvestmentPlansState extends State<InvestmentPlans> {
  // _InvestmentPlansState() {
  //   _selectedDuration = _selectDuration[0];
  // }

  // final _selectDuration = ['1 Week', '2 Weeks', '3 Weeks', '1 Month'];

  // String? _selectedDuration = 'All Categories';

  var planController = Get.find<PlanController>();

  // TextEditingController enterAmountController = TextEditingController();

  // @override
  // void dispose() {
  //   enterAmountController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'INVESTMENT PLANS',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Obx(() {
        return ListView.builder(
            itemCount: planController.actualPlansList.length, //plans.length,
            itemBuilder: (context, index) {
              var realPlan = planController.actualPlansList[index];
              int sweetIndex = generateRandomIndex();
              return InvestmentPlanWidget(
                sweetIndex: sweetIndex,
                realPlan: realPlan,
              );
            });
      }),
    );
  }
}

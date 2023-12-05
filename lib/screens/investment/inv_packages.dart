import 'package:bulloak_fin_mgt_fin_mgt/controllers/plan_controller.dart';
import 'package:bulloak_fin_mgt_fin_mgt/data/inv_packages_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestmentPackages extends GetView<PlanController> {
  const InvestmentPackages({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
          title: Text(
            'INVESTMENT PACKAGES',
            style: GoogleFonts.poppins(),
          ),
        ),
        body: Center(
          child: Obx(() {
            return ListView.builder(
              itemCount: controller.allPackagesList.length,
              itemBuilder: (context, index) {
                var pg = controller.allPackagesList[index];
                var spIndex = generateRandomPackages();
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: h * 0.02, horizontal: w * 0.075),
                  child: Container(
                    height: h * 0.24,
                    width: w * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(packages[spIndex]['image']),
                          fit: BoxFit.contain),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          spreadRadius: 1,
                          offset: Offset(
                            0,
                            3,
                          ),
                        )
                      ],
                    ),
                    child: Center(
                        child: GestureDetector(
                      onTap: () {
                        controller.fetchPlanHistory();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: h * 0.1),
                        height: h * 0.05,
                        width: w * 0.35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                              spreadRadius: 1,
                              offset: Offset(
                                0,
                                3,
                              ),
                            )
                          ],
                        ),
                        child: Center(
                            child: Text(
                          '${pg.name} Plan',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )),
                      ),
                    )),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}

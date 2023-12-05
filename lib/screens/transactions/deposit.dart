import 'package:bulloak_fin_mgt_fin_mgt/controllers/transaction_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';
import '../../widgets/custom_button.dart';

class Deposit extends StatefulWidget {
  const Deposit({super.key});

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  var depositFormKey = GlobalKey<FormState>();

  final _selectPaymentType = ['BITCOIN', 'ETH', 'USDT', 'PAYPAL', 'XRP'];
  String _selectedVal = 'BITCOIN';

  var amountController = TextEditingController();
  var usdtAmountController = TextEditingController();
  var walletAddressController = TextEditingController();

  // Txn controller
  var txnController = Get.find<TransactionController>();

  @override
  void dispose() {
    amountController.dispose();
    usdtAmountController.dispose();
    walletAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (() => Get.back()),
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            ' Make a deposit',
            style: GoogleFonts.poppins(),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: h * 0.05, right: w * 0.2),
                  child: Text(
                    'Use this form to make a deposit',
                    style: GoogleFonts.poppins(fontSize: w * 0.04),
                  ),
                ), //////////////
                SizedBox(height: h * 0.04),
                Form(
                  key: depositFormKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: w * 0.45),
                        child: Text(
                          'Enter Amount',
                          style: GoogleFonts.poppins(fontSize: w * 0.055),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: h * 0.02),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: ' Enter Amount eg 100.20',
                            focusedBorder: const OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(w * 0.05),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            labelStyle:
                                const TextStyle(color: AppColors.fillText),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w * 0.02),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Amount field cannnot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                      Container(
                        padding: EdgeInsets.only(top: h * 0.02),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: ' Enter USDT Amount eg 20.00',
                            focusedBorder: const OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(w * 0.05),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            labelStyle:
                                const TextStyle(color: AppColors.fillText),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w * 0.02),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'USDT Amount field cannnot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: h * 0.04),
                      Container(
                        margin: const EdgeInsets.only(left: 20, bottom: 10),
                        height: 50,
                        width: w,
                        child: DropdownButtonFormField(
                          iconDisabledColor: Colors.grey[700],
                          iconEnabledColor: Colors.grey[700],
                          value: _selectedVal,
                          items: _selectPaymentType
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
                              _selectedVal = value as String;
                            });
                            if (kDebugMode) print(_selectedVal); //testing
                          },
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                      Container(
                        padding: EdgeInsets.only(top: h * 0.02),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: ' Enter Wallet Address',
                            focusedBorder: const OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(w * 0.05),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            labelStyle:
                                const TextStyle(color: AppColors.fillText),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w * 0.02),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Wallet Address field cannnot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.08),
                GestureDetector(
                  onTap: () {
                    if (depositFormKey.currentState!.validate()) {
                      // calling deposit function
                      txnController.depositMyFunds(
                        amount: amountController.text.trim(),
                        walletAddress: walletAddressController.text,
                        usdtAmount: usdtAmountController.text.trim(),
                        walletType: _selectedVal,
                      );
                    }
                  },
                  child: Obx(() {
                    return CustomButton(
                      height: h * 0.08,
                      width: w * 0.8,
                      text: txnController.isLoading.value
                          ? 'processing . . .'
                          : 'Deposit',
                      color: AppColors.secondaryColor,
                      circularRadius: 50,
                    );
                  }),
                ),
                SizedBox(height: h * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bulloak_fin_mgt_fin_mgt/controllers/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';
import '../../widgets/custom_button.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({super.key});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  _TransactionHistoryState() {
    _selectedVal = _selectPaymentType[0];
  }

  final _selectPaymentType = ['BITCOIN', 'ETH', 'USDT', 'PAYPAL', 'XRP'];
  String _selectedVal = 'BITCOIN';

  var withdrawFormKey = GlobalKey<FormState>();

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
            ' Make a withdrawal',
            style: GoogleFonts.poppins(),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: h * 0.05),
                      child: Text(
                        'Minimum withdrawal = 0',
                        style: GoogleFonts.poppins(
                            fontSize: w * 0.04, color: AppColors.primaryColor),
                      ),
                    ),
                    Text(
                      'Minimum withdrawal = 99999999',
                      style: GoogleFonts.poppins(
                          fontSize: w * 0.04, color: AppColors.primaryColor),
                    ),
                  ],
                ), //////////////
                SizedBox(height: h * 0.04),
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
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: ' Enter Amount',
                      focusedBorder: const OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(w * 0.05),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      labelStyle: const TextStyle(color: AppColors.fillText),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.02),
                          borderSide: const BorderSide(color: Colors.grey)),
                    ),
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
                    },
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: h * 0.04),

                Container(
                  padding: EdgeInsets.only(top: h * 0.02),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: ' Enter Address',
                      focusedBorder: const OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(w * 0.05),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      labelStyle: const TextStyle(color: AppColors.fillText),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.02),
                          borderSide: const BorderSide(color: Colors.grey)),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.10),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (withdrawFormKey.currentState!.validate()) {
                        // calling withdraw function
                        txnController.withdrawMyFunds(
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
                            : 'Withdraw',
                        color: AppColors.secondaryColor,
                        circularRadius: 50,
                      );
                    }),
                  ),
                ),
                SizedBox(height: h * 0.10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

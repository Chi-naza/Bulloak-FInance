import 'dart:ffi';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';

import '../../colors.dart';
import '../../controllers/transferController.dart';
import '../../widgets/custom_button.dart';

class MakeTransfer extends StatefulWidget {
  const MakeTransfer({super.key});

  @override
  State<MakeTransfer> createState() => _MakeTransferState();
}

class _MakeTransferState extends State<MakeTransfer> {
  final transferController = TransferController;

  TextEditingController textEditingController = TextEditingController();

  String walletAddress = '';

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (() => Get.back()),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          ' Make a Transfer',
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
                  'Use this form to make a transfer',
                  style: GoogleFonts.poppins(fontSize: w * 0.04),
                ),
              ), //////////////
              SizedBox(height: h * 0.04),
              Form(
                // key: depositFormKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: w * 0.45),
                      child: Text(
                        'Wallet Address',
                        style: GoogleFonts.poppins(fontSize: w * 0.055),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: h * 0.01,
                      ),
                      child: TextFormField(
                        controller: textEditingController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Enter Wallet Address',
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
                              borderSide: const BorderSide(color: Colors.grey)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Amount field cannnot be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: h * 0.03),
                    Container(
                      margin: EdgeInsets.only(right: w * 0.45),
                      child: Text(
                        'Email Address',
                        style: GoogleFonts.poppins(fontSize: w * 0.055),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: h * 0.01),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Enter Email Address',
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
                              borderSide: const BorderSide(color: Colors.grey)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: h * 0.03),
                    Container(
                      margin: EdgeInsets.only(right: w * 0.6),
                      child: Text(
                        'Amount',
                        style: GoogleFonts.poppins(fontSize: w * 0.055),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: h * 0.01),
                      child: TextFormField(
                        inputFormatters: [
                          NumberTextInputFormatter(
                            integerDigits: 10,
                            decimalDigits: 2,
                            maxValue: '1000000000.00',
                            decimalSeparator: '.',
                            groupDigits: 3,
                            groupSeparator: ',',
                            allowNegative: false,
                            overrideDecimalPoint: true,
                            insertDecimalPoint: false,
                            insertDecimalDigits: true,
                          ),
                        ],
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
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
                              borderSide: const BorderSide(color: Colors.grey)),
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
                  onTap: () {},
                  child: CustomButton(
                    height: h * 0.08,
                    width: w * 0.8,
                    text: 'Transfer',
                    color: AppColors.secondaryColor,
                    circularRadius: 50,
                  )),
              SizedBox(height: h * 0.08),
            ],
          ),
        ),
      ),
    );
  }
}

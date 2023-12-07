import 'package:bulloak_fin_mgt_fin_mgt/colors.dart';
import 'package:bulloak_fin_mgt_fin_mgt/controllers/transaction_controller.dart';
import 'package:bulloak_fin_mgt_fin_mgt/data/transactions_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  _TransactionHistoryState() {
    _selectedVal = _selectCategories[0];
  }

  final _selectCategories = [
    'All Categories',
    'Category 1',
    'Category 2',
    'Category 3'
  ];
  String? _selectedVal = 'All Categories';

  final _selectStatus = ['Any Status', 'Status 1', 'Status 2', 'Status 3'];
  String? _selectedSta = 'Any Status';

  var txnController = Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 233, 241),
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'Transactions',
          style: GoogleFonts.poppins(),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.more_horiz),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, bottom: 10),
                height: 50,
                width: 140,
                child: DropdownButtonFormField(
                  iconDisabledColor: Colors.grey[700],
                  iconEnabledColor: Colors.grey[700],
                  value: _selectedVal,
                  items: _selectCategories
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
              ), //////////////////
              Container(
                margin: const EdgeInsets.only(left: 20, bottom: 10),
                height: 50,
                width: 140,
                child: DropdownButtonFormField(
                  iconDisabledColor: Colors.grey[700],
                  iconEnabledColor: Colors.grey[700],
                  value: _selectedSta,
                  items: _selectStatus
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
                      _selectedSta = value as String;
                    });
                  },
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.025),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '2023/09/07 - 2023/11/06',
            style: GoogleFonts.poppins(
                fontSize: 15, color: Colors.black.withOpacity(0.5)),
          ),
          SizedBox(
            height: h * 0.002,
          ),
          Row(
            children: [
              RichText(
                  text: TextSpan(
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.4)),
                      children: <TextSpan>[
                    const TextSpan(text: 'In: '),
                    TextSpan(
                        text: 'N675,777,768.05',
                        style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.4))),
                  ])),
              SizedBox(width: w * 0.03),
              RichText(
                  text: TextSpan(
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.4)),
                      children: <TextSpan>[
                    const TextSpan(text: 'Out: '),
                    TextSpan(
                        text: 'N453,765.87',
                        style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.4))),
                  ])),
            ],
          ),
          SizedBox(height: h * 0.02),
          Container(
            width: w,
            height: 540.h,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ]),
            child: Obx(() {
              return ListView.separated(
                itemCount: txnController
                    .transactionList.length, // transactions.length,
                itemBuilder: (context, index) {
                  var txn = txnController.transactionList[index];

                  var parsedDate = DateTime.parse(txn.created!);
                  var createdAt = DateFormat('EEE, M/d/y').format(parsedDate);
                  print(createdAt);

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 0.008),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: w * 0.06,
                      ),
                      title: Text(
                        txn.transactionType!, //transactions[index]['title'],
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        createdAt, //txn.created.toString()d, //'November 6, 18:43',
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            txn.usdtAmount ??
                                '', //transactions[index]['amount'],
                            style: GoogleFonts.poppins(
                                fontSize: 13, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Successful'.toLowerCase(),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              );
            }),
          )
        ]),
      ),
    );
  }
}

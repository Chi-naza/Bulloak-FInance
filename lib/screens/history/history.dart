import 'package:bulloak_fin_mgt_fin_mgt/colors.dart';
import 'package:bulloak_fin_mgt_fin_mgt/controllers/dashboard_controller.dart';
import 'package:bulloak_fin_mgt_fin_mgt/controllers/transaction_controller.dart';
import 'package:bulloak_fin_mgt_fin_mgt/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

final bucketGlobal = PageStorageBucket();

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  var txnController = Get.find<TransactionController>();
  var dashController = Get.find<DashboardController>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    txnController.fetchAllTransactions();
    txnController.fetchWithdrawalHistory();
    txnController.fetchMyReferrals();
    super.dispose();
  }

  // //tab item
  final List<Widget> _tabs = const [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Tab(text: 'Deposits'),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Tab(text: 'Withdrawals'),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Tab(text: 'Referrals'),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Tab(text: 'Transfers'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var userName =
        "${dashController.userDashboardInfo.value.profile!.user!.username}";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(children: [
            CreditCardWidget(
              glassmorphismConfig: Glassmorphism(
                blurX: 0,
                blurY: 0,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.grey.withAlpha(20),
                    Colors.white.withAlpha(20),
                  ],
                  stops: const <double>[
                    0.3,
                    0,
                  ],
                ),
              ),
              cardNumber: '',
              expiryDate: '',
              cardHolderName: userName,
              cvvCode: '123',
              bankName: 'User\'s Bank',
              textStyle: GoogleFonts.poppins(color: Colors.white),
              frontCardBorder: Border.all(color: Colors.grey),
              backCardBorder: Border.all(color: Colors.grey),
              showBackView: false,
              obscureCardNumber: true,
              obscureCardCvv: true,
              enableFloatingCard: true,
              isHolderNameVisible: true,
              cardBgColor: Colors.black,
              backgroundImage: 'assets/images/card_bg.png',
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              customCardTypeIcons: <CustomCardTypeIcon>[
                CustomCardTypeIcon(
                  cardType: CardType.mastercard, //type of card
                  cardImage: Image.asset(
                    'assets/images/mastercard.png',
                    height: 48,
                    width: 48,
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Container(
                width: w,
                height: 452.h,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: PageStorage(
                  bucket: bucketGlobal,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(h * 0.015),
                        child: Container(
                          height: h * 0.008,
                          width: w * 0.1,
                          decoration: BoxDecoration(
                              color: const Color(0xffAAAAAA),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SizedBox(
                                height: kToolbarHeight - 33,
                                child: TabBar(
                                  // isScrollable: true,
                                  controller: _tabController,
                                  tabs: _tabs,
                                  labelColor: Colors.white,
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(80),
                                      color: AppColors.primaryColor),
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelPadding: EdgeInsets.zero,
                                  indicatorPadding: EdgeInsets.zero,
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 14,
                        child: Obx(
                          () {
                            return TabBarView(
                              controller: _tabController,
                              children: [
                                ReusableTabBody(
                                  key: const PageStorageKey('pageOne'),
                                  dataObjectList:
                                      txnController.depositTxnList.value,
                                ),
                                ReusableTabBody(
                                  key: const PageStorageKey('pageTwo'),
                                  dataObjectList:
                                      txnController.withdrawTxnList.value,
                                ),
                                ReusableTabBody(
                                  key: const PageStorageKey('pageThree'),
                                  dataObjectList:
                                      txnController.referralListHistory.value,
                                  isReferral: true,
                                ),
                                ReusableTabBody(
                                  key: const PageStorageKey('pageFour'),
                                  dataObjectList:
                                      txnController.transferTxnList.value,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class ReusableTabBody extends StatelessWidget {
  final List<TransactionModel> dataObjectList;
  final bool isWithdrawal;
  final bool isReferral;

  const ReusableTabBody({
    super.key,
    required this.dataObjectList,
    this.isWithdrawal = false,
    this.isReferral = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: dataObjectList.length,
        itemBuilder: (context, index) {
          var data = dataObjectList[index];
          var dateTime =
              isReferral ? DateTime.now() : DateTime.parse(data.created!);
          var actualDate = isReferral
              ? "Referred Email Address"
              : DateFormat.yMEd().format(dateTime);
          print("Actual DATE: $actualDate");

          return ListTile(
            title: Text(
              actualDate, //'Today 4:17pm',
              style: GoogleFonts.poppins(fontSize: 12),
            ),
            subtitle: Text(
              "${data.description}", //'Andre Bethel',
              style: GoogleFonts.poppins(
                  fontSize: 13, fontWeight: FontWeight.w800),
            ),
            trailing: Text(
              '\$${double.parse(data.usdtAmount ?? '0.00').toStringAsFixed(2)}',
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: isWithdrawal ? Colors.red : AppColors.secondaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        },
      ),
    );
  }
}

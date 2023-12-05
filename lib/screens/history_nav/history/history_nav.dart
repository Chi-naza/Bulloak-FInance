import 'package:bulloak_fin_mgt_fin_mgt/colors.dart';
import 'package:bulloak_fin_mgt_fin_mgt/screens/history_nav/history/history.dart';
import 'package:bulloak_fin_mgt_fin_mgt/screens/history_nav/other_screens/acc_balance.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../nav_screens/wallet.dart';
import '../other_screens/transactionhistory.dart';

class HistoryNav extends StatefulWidget {
  const HistoryNav({super.key});

  @override
  State<HistoryNav> createState() => _HomeState();
}

class _HomeState extends State<HistoryNav> {
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    final List<Widget> screens = [
      const History(),
      const TransactionHistory(),
      const Stats(),
      const AccBal()
    ];
    return Scaffold(
        body: screens[_page],
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: w * 0.02, left: h * 0.02, right: h * 0.02),
            child: GNav(
              backgroundColor: Colors.white,
              color: AppColors.secondaryColor,
              activeColor: AppColors.primaryColor,
              tabBackgroundColor: AppColors.secondaryColor.withOpacity(0.5),
              gap: w * 0.01,
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.05, vertical: h * 0.018),
              tabs: const [
                GButton(icon: Icons.history, text: 'History'),
                GButton(icon: Iconsax.transaction_minus, text: 'Transactions'),
                GButton(icon: Icons.bar_chart, text: 'Charts'),
                GButton(icon: Iconsax.wallet_15, text: 'Wallet'),
              ],
              selectedIndex: _page,
              onTabChange: (index) {
                setState(() {
                  _page = index;
                });
              },
            ),
          ),
        ));
  }
}

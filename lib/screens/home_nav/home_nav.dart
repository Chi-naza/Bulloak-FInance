import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';
import '../nav_screens/dashboard.dart';
import '../nav_screens/settings.dart';
import '../nav_screens/subscription.dart';
import '../nav_screens/wallet.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeState();
}

class _HomeState extends State<HomeNav> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const DashBoard(),
      const Subscription(),
      const Stats(),
      const Settings()
    ];
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: GoogleFonts.poppins(),
        selectedItemColor: Colors.black,
        unselectedItemColor: AppColors.secondaryColor,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet_rounded), label: 'Portfolio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.money_sharp), label: 'Subscriptions'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}

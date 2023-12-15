import 'package:bulloak_fin_mgt_fin_mgt/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final bucketGlobal = PageStorageBucket();

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
      child: Tab(text: 'Investments'),
    ),
  ];

  //tab body
  final List<Widget> _tabsBody = [
    ReusableTabBody(
      key: const PageStorageKey('pageOne'),
      avatar: const CircleAvatar(
        backgroundColor: Colors.white,
        radius: 25,
        child: Icon(
          Icons.arrow_upward,
          color: AppColors.secondaryColor,
        ),
      ),
      title: Text('Today 4:17pm', style: GoogleFonts.poppins(fontSize: 12)),
      subtitle: Text('Andre Bethel',
          style:
              GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: Text('\$10.00',
          style: GoogleFonts.poppins(
              fontSize: 13,
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w400)),
    ),
    ReusableTabBody(
      key: const PageStorageKey('pageTwo'),
      avatar: const CircleAvatar(
        backgroundColor: Colors.white,
        radius: 25,
        child: Icon(
          Icons.arrow_downward,
          color: Colors.redAccent,
        ),
      ),
      title: Text('Today 4:17pm', style: GoogleFonts.poppins(fontSize: 12)),
      subtitle: Text('User',
          style:
              GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: Text('\$10.00',
          style: GoogleFonts.poppins(
              fontSize: 13, color: Colors.red, fontWeight: FontWeight.w400)),
    ),
    ReusableTabBody(
      key: const PageStorageKey('pageThree'),
      avatar: const CircleAvatar(backgroundColor: Colors.white, radius: 25),
      title: Text('Today 4:17pm', style: GoogleFonts.poppins(fontSize: 12)),
      subtitle: Text('User',
          style:
              GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: Text('\$10.00',
          style: GoogleFonts.poppins(
              fontSize: 13,
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w400)),
    ),
    ReusableTabBody(
      key: const PageStorageKey('pageFour'),
      avatar: const CircleAvatar(backgroundColor: Colors.white, radius: 25),
      title: Text('Today 4:17pm', style: GoogleFonts.poppins(fontSize: 12)),
      subtitle: Text('User',
          style:
              GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: Text('\$10.00',
          style: GoogleFonts.poppins(
              fontSize: 13,
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w400)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
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
            Image.asset('assets/images/creditcard.png'),
            SingleChildScrollView(
              child: Container(
                width: w,
                height: 480.h,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: PageStorage(
                  bucket: bucketGlobal,
                  child: Column(children: [
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
                        child: TabBarView(
                          controller: _tabController,
                          children: _tabsBody,
                        ))
                  ]),
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
  final CircleAvatar avatar;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;

  const ReusableTabBody({
    super.key,
    required this.avatar,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: avatar,
              title: title,
              subtitle: subtitle,
              trailing: trailing,
            );
          }),
    );
  }
}

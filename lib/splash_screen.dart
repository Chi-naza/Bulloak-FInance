import 'package:bulloak_fin_mgt_fin_mgt/controllers/auth_controller.dart';
import 'package:bulloak_fin_mgt_fin_mgt/routes/names.dart';
import 'package:bulloak_fin_mgt_fin_mgt/services/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () async {
      var sp = await SharedPreferences.getInstance();
      bool isRemember = sp.getBool(IS_REMEMBER) ?? false;
      String token = sp.getString(TOKEN) ?? "";

      print("IS REMEMBER: $isRemember");
      print("TOKEN $token");

      if (isRemember && token.isNotEmpty) {
        Get.offAllNamed(AppRoutes.dashboard);
      } else {
        Get.offAllNamed(AppRoutes.INITIAL);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/bulloaklogo.png'),
      ),
    );
  }
}

import 'dart:convert';

import 'package:bulloak_fin_mgt_fin_mgt/routes/names.dart';
import 'package:bulloak_fin_mgt_fin_mgt/screens/auth/recovery/resetPSWD.dart';
import 'package:bulloak_fin_mgt_fin_mgt/services/api_endpoints.dart';
import 'package:bulloak_fin_mgt_fin_mgt/services/helper_methods.dart';
import 'package:bulloak_fin_mgt_fin_mgt/widgets/custom_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  // get connect
  final _getConnect = GetConnect();

  // loading
  final isLoading = false.obs;

  Future<void> signUpUser({
    required String email,
    required String userName,
    required String password,
    required String referralCode,
  }) async {
    // loading
    isLoading.value = true;

    // shared pref
    final shp = await SharedPreferences.getInstance();

    var myBody = jsonEncode({
      "email": email,
      "password": password,
      "username": userName,
      "referral_code": referralCode,
    });

    try {
      Response response = await _getConnect.post(
        BulloakAPI.registerEndpoint,
        myBody,
        headers: myFreeHeaders(),
      );

      if (kDebugMode) print("REGISTER: ${response.body}");
      if (kDebugMode) print("STATUS: ${response.statusCode}");

      if (response.statusCode == 201) {
        // set data
        await shp.setString(EMAIL, email);
        await shp.setString(PASSWORD, password);

        isLoading.value = false;
        bulloakSnackbar(isError: false, message: 'Registration Successful');

        Get.toNamed(AppRoutes.otpverify);
      } else {
        isLoading.value = false;
        if (response.body['email'] != null) {
          bulloakSnackbar(
              isError: true, message: '${response.body['email'][0]}');
        } else if (response.body['username'] != null) {
          bulloakSnackbar(
              isError: true, message: '${response.body['username'][0]}');
        } else if (response.body['password'] != null) {
          bulloakSnackbar(
              isError: true, message: '${response.body['password'][0]}');
        } else if (response.body['Error'] != null) {
          bulloakSnackbar(
              isError: true, message: '${response.body['Error'][0]}');
        }
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("Register: $e");
    }
  }

  // Sign In
  Future<void> signInUser({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    // loading
    isLoading.value = true;

    // shared pref
    final shp = await SharedPreferences.getInstance();

    var myBody = jsonEncode({
      "email": email,
      "password": password,
    });

    try {
      Response response = await _getConnect.post(
        BulloakAPI.loginEndpoint,
        myBody,
        headers: myFreeHeaders(),
      );

      if (kDebugMode) print("LOGIN: ${response.body}");
      if (kDebugMode) print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        // set data
        await shp.setString(EMAIL, email);
        await shp.setString(PASSWORD, password);
        await shp.setBool(IS_REMEMBER, rememberMe);
        await shp.setString(TOKEN, response.body["token"]["access"]);

        print("TOKEN FROM DB: ${response.body["token"]["access"]}");

        isLoading.value = false;
        bulloakSnackbar(isError: false, message: 'Login Successful');
        Get.offAllNamed(AppRoutes.dashboard);
      } else {
        isLoading.value = false;
        if (response.body['Error'] != null) {
          bulloakSnackbar(
              isError: true,
              message: 'Login Failed: ${response.body['Error'][0]}');
        } else if (response.body["error"] != null) {
          if (response.body["error"][0]
              .toString()
              .contains('This user is currently not active')) {
            bulloakSnackbar(
                isError: true, message: 'This user is currently not active');
            Get.toNamed(AppRoutes.otpverify);
          }
        }
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("Login: $e");
    }
  }

  // Verify Account
  Future<void> verifyAccount(String verificationCode) async {
    // loading
    isLoading.value = true;

    var myBody = jsonEncode({"verification_code": verificationCode});

    try {
      Response response = await _getConnect.post(
        BulloakAPI.verifyEmailEndpoint,
        myBody,
        headers: myFreeHeaders(),
      );

      if (kDebugMode) print("VERIFICATION: ${response.body}");
      if (kDebugMode) print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        isLoading.value = false;
        bulloakSnackbar(
            isError: false, message: 'Account verification successful');
        Get.toNamed(AppRoutes.login);
      } else {
        isLoading.value = false;
        bulloakSnackbar(isError: true, message: response.body["error"]);
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("Verification: $e");
    }
  }

  // This function start password reset: sends otp
  Future<void> startPasswordReset(String email) async {
    Map<String, String> resetBody = {
      "email": email,
    };

    isLoading.value = true;

    Response response = await _getConnect.post(
      BulloakAPI.passwordResetEndpoint,
      resetBody,
      headers: myFreeHeaders(),
    );

    if (response.statusCode == 200) {
      isLoading.value = false;
      bulloakSnackbar(
        message: "Reset code has been sent to the email you provided",
        isError: false,
      );
      // Go to complete pswd reset otp
      Get.to(const ResetPSWD());
    } else {
      isLoading.value = false;
      debugPrint(response.statusText);
      bulloakSnackbar(
        message: 'Reset Password failed',
        isError: true,
      );
    }
  }

  // This function completes password reset
  Future<void> completePswdReset(
      {required String newPswd, required String otp}) async {
    Map<String, String> resetBody = {
      "password": newPswd,
      "verification_code": otp
    };

    isLoading.value = true;

    Response response = await _getConnect.post(
      BulloakAPI.passwordResetCompleteEndpoint,
      resetBody,
      headers: myFreeHeaders(),
    );

    if (response.statusCode == 200) {
      bulloakSnackbar(
        message: 'Successful',
        isError: false,
      );
      isLoading.value = false;
      // Go to login
      Get.offAllNamed(AppRoutes.login);
    } else {
      debugPrint("BODY: ${response.body}");
      debugPrint("STATUS: ${response.statusCode}");
      debugPrint(response.statusText);
      isLoading.value = false;
      bulloakSnackbar(
        message:
            "${response.statusText!}: invalid or expired verification code",
        isError: true,
      );
    }
  }

  Future<void> logoutUser() async {
    var sp = await SharedPreferences.getInstance();
    if (await sp.clear()) {
      bulloakSnackbar(isError: false, message: "Logout Successful");
      Get.toNamed(AppRoutes.login);
    }
  }
}

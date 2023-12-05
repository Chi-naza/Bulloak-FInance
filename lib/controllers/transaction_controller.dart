import 'dart:convert';

import 'package:bulloak_fin_mgt_fin_mgt/models/dep_hist_model.dart';
import 'package:bulloak_fin_mgt_fin_mgt/models/transaction_model.dart';
import 'package:bulloak_fin_mgt_fin_mgt/routes/names.dart';
import 'package:bulloak_fin_mgt_fin_mgt/services/api_endpoints.dart';
import 'package:bulloak_fin_mgt_fin_mgt/services/helper_methods.dart';
import 'package:bulloak_fin_mgt_fin_mgt/widgets/custom_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  // loading indicator
  final isLoading = false.obs;

  // get connect
  final _getConnect = GetConnect();

  // plan withdrawal history list
  final withdrawalHistoryList = <DepWithDrawalModel>[].obs;

  // plan withdrawal history list
  final transactionList = <TransactionModel>[].obs;

  @override
  void onReady() {
    fetchAllTransactions();
    fetchWithdrawalHistory();
    super.onReady();
  }

  // withdraw function
  Future<void> withdrawMyFunds({
    required String amount,
    required String walletAddress,
    required String walletType,
    required String usdtAmount,
  }) async {
    // loading
    isLoading.value = true;

    var myBody = jsonEncode({
      "amount": amount,
      "wallet_type": walletType,
      "wallet_address": walletAddress,
      "usdt_amount": usdtAmount
    });

    try {
      Response response = await _getConnect.post(
        BulloakAPI.withdrawEndpoint,
        myBody,
        headers: await myHeaders(),
      );

      if (kDebugMode) print("WITHDRAW BODY: ${response.body}");
      if (kDebugMode) print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        isLoading.value = false;
        bulloakSnackbar(isError: false, message: 'WWithdrawal Successful!');
        Get.toNamed(AppRoutes.homenav);
      } else {
        isLoading.value = false;
        bulloakSnackbar(isError: true, message: "Withdrawal failed");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("WITHDRAW: $e");
    }
  }

  // withdraw function
  Future<void> depositMyFunds({
    required String amount,
    required String walletAddress,
    required String walletType,
    required String usdtAmount,
  }) async {
    // loading
    isLoading.value = true;

    var myBody = jsonEncode({
      "amount": amount,
      "wallet_type": walletType,
      "wallet_address": walletAddress,
      "usdt_amount": usdtAmount
    });

    try {
      Response response = await _getConnect.post(
        BulloakAPI.depositEndpoint,
        myBody,
        headers: await myHeaders(),
      );

      if (kDebugMode) print("DEPOSIT txn BODY: ${response.body}");
      if (kDebugMode) print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        isLoading.value = false;
        bulloakSnackbar(
            isError: false, message: "Successful! ${response.body}");
        Get.toNamed(AppRoutes.homenav);
      } else {
        isLoading.value = false;
        bulloakSnackbar(isError: true, message: "DEPOSIT txn failed");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("DEPOSIT txn: $e");
    }
  }

  // fetch withdrawal histories
  Future<void> fetchWithdrawalHistory() async {
    try {
      Response response = await _getConnect.get(
        BulloakAPI.withdrawEndpoint,
        headers: await myHeaders(),
      );

      if (kDebugMode) print("WITHDRAWAL HISTORY: ${response.body}");
      if (kDebugMode) print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        isLoading.value = false;
        if (kDebugMode) print("WITHDRAWAL HISTORY GOTTEN successfully");
        var dataList = <DepWithDrawalModel>[];
        for (var a in response.body[0]) {
          dataList.add(DepWithDrawalModel.fromJson(a));
        }
        withdrawalHistoryList.assignAll(dataList);
        if (kDebugMode) print(dataList);
      } else {
        isLoading.value = false;
        if (kDebugMode) print("Failed To Get WITHDRAWAL History");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("GET WITHDRAWAL HISTORY ERROR: $e");
    }
  }

  // fetch withdrawal histories
  Future<void> fetchAllTransactions() async {
    try {
      Response response = await _getConnect.get(
        BulloakAPI.allTxnEndpoint,
        headers: await myHeaders(),
      );

      if (kDebugMode) print("ALL TRANSACTIONS HISTORY: ${response.body}");
      if (kDebugMode) print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        isLoading.value = false;
        if (kDebugMode) print("ALL TRANSACTIONS HISTORY GOTTEN successfully");
        var dataList = <TransactionModel>[];
        for (var a in response.body) {
          dataList.add(TransactionModel.fromJson(a));
        }
        transactionList.assignAll(dataList);
        if (kDebugMode) print(dataList);
      } else {
        isLoading.value = false;
        if (kDebugMode) print("Failed To Get ALL TRANSACTIONS History");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("GET ALL TRANSACTIONS HISTORY ERROR: $e");
    }
  }
}

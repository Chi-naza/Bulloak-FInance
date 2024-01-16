import 'dart:convert';

import 'package:bulloak_fin_mgt_fin_mgt/models/dep_hist_model.dart';
import 'package:bulloak_fin_mgt_fin_mgt/models/referral_model.dart';
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

  // transactions
  final transactionList = <TransactionModel>[].obs;
  final depositTxnList = <TransactionModel>[].obs;
  final withdrawTxnList = <TransactionModel>[].obs;
  final transferTxnList = <TransactionModel>[].obs;

  // referral list
  final referralList = <ReferralModel>[].obs;
  final referralListHistory = <TransactionModel>[].obs;

  @override
  void onReady() {
    fetchAllTransactions();
    fetchWithdrawalHistory();
    fetchMyReferrals();
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
        Get.toNamed(AppRoutes.dashboard);
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
        Get.toNamed(AppRoutes.dashboard);
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

        // data lists for formatting individual txns
        var withdrawDataList = <TransactionModel>[];
        var transferDataList = <TransactionModel>[];
        var depositDataList = <TransactionModel>[];

        // getting individual Transactions
        for (var txn in transactionList) {
          if (txn.transactionType == "withdraw") {
            withdrawTxnList.add(txn);
          } else if (txn.transactionType == "transfer") {
            transferDataList.add(txn);
          } else if (txn.transactionType == "deposit") {
            depositDataList.add(txn);
          }
        }

        withdrawTxnList.assignAll(withdrawDataList);
        transferTxnList.assignAll(transferDataList);
        depositTxnList.assignAll(depositDataList);

        if (kDebugMode) print("ALL TXN: $transactionList");
        if (kDebugMode) print("ALL DEPOSIT: $withdrawTxnList");
        if (kDebugMode) print("ALL TRANSFER: $transferTxnList");
        if (kDebugMode) print("ALL DEPOSIT: $depositTxnList");
      } else {
        isLoading.value = false;
        if (kDebugMode) print("Failed To Get ALL TRANSACTIONS History");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("GET ALL TRANSACTIONS HISTORY ERROR: $e");
    }
  }

  // withdraw function
  Future<void> transferMyFunds({
    required String email,
    required String amount,
  }) async {
    // loading
    isLoading.value = true;

    var myBody = jsonEncode({
      "email": email,
      "usdt_amount": amount,
    });

    try {
      Response response = await _getConnect.post(
        BulloakAPI.transferEndpoint,
        myBody,
        headers: await myHeaders(),
      );

      if (kDebugMode) print("TRANSFER txn BODY: ${response.body}");
      if (kDebugMode) print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        isLoading.value = false;
        bulloakSnackbar(
            isError: false, message: "Transfer Successful! ${response.body}");
        Get.toNamed(AppRoutes.dashboard);
      } else {
        isLoading.value = false;
        bulloakSnackbar(isError: true, message: "TRANSFER txn failed");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("TRANSFER txn: $e");
    }
  }

  // fetch withdrawal histories
  Future<void> fetchMyReferrals() async {
    try {
      Response response = await _getConnect.get(
        BulloakAPI.referralEndpoint,
        headers: await myHeaders(),
      );

      if (kDebugMode) print("GET REFERRAL : ${response.body}");
      if (kDebugMode) print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        isLoading.value = false;
        if (kDebugMode) print("ALL REFERRALs GOTTEN successfully");
        var dataList = <ReferralModel>[];
        for (var a in response.body) {
          dataList.add(ReferralModel.fromJson(a));
        }
        referralList.assignAll(dataList);

        var dataList2 = <TransactionModel>[];
        for (var ref in referralList) {
          dataList2.add(TransactionModel(
            usdtAmount: ref.referralProfit,
            description: ref.referredUser!.email,
          ));
        }
        referralListHistory.assignAll(dataList2);

        if (kDebugMode) print(referralList);
        if (kDebugMode) print("REFERRAL TXN - $referralListHistory");
      } else {
        isLoading.value = false;
        if (kDebugMode) print("Failed To Get ALL REFERRALs");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("GET ALL REFERRALs  ERROR: $e");
    }
  }
}

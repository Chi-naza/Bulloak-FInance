import 'dart:convert';

import 'package:bulloak_fin_mgt_fin_mgt/models/plan_history_model.dart';
import 'package:bulloak_fin_mgt_fin_mgt/models/plan_response_model.dart';
import 'package:bulloak_fin_mgt_fin_mgt/services/api_endpoints.dart';
import 'package:bulloak_fin_mgt_fin_mgt/services/helper_methods.dart';
import 'package:bulloak_fin_mgt_fin_mgt/widgets/custom_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class PlanController extends GetxController {
  final isLoading = false.obs;

  // all Plans
  final allPlansList = <PlanResponseModel>[].obs;
  final actualPlansList = <Plans>[].obs;

  // all Packages (categories)
  final allPackagesList = <Categories>[].obs;

  // get connect
  final _getConnect = GetConnect();

  // plan history list
  final planHistoryList = <PlanHistoryModel>[].obs;

  @override
  void onReady() {
    fetchAllPlans();
    fetchPlanHistory();
    super.onReady();
  }

  // subscribe to a plan
  Future<void> subscribeToAPlan(
      {required int amount, required String planName}) async {
    // loading
    isLoading.value = true;

    var myBody = jsonEncode({
      "amount": amount,
      "plan_name": planName,
    });

    try {
      Response response = await _getConnect.post(
        BulloakAPI.subscribeToPlanEndpoint,
        myBody,
        headers: await myHeaders(),
      );

      if (kDebugMode) print("SUBSCRIBE PLAN: ${response.body}");
      if (kDebugMode) print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        isLoading.value = false;
        bulloakSnackbar(isError: false, message: response.body['message']);
      } else {
        isLoading.value = false;
        bulloakSnackbar(
            isError: true,
            message: "Subscription failed. ${response.body['message']}");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("Subscription: $e");
    }
  }

  // subscribe to a plan
  Future<void> fetchAllPlans() async {
    try {
      Response response = await _getConnect.get(
        BulloakAPI.getAllPlansEndpoint,
        headers: await myHeaders(),
      );

      if (kDebugMode) print("PLANS & PACKAGES: ${response.body}");
      if (kDebugMode) print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        isLoading.value = false;
        if (kDebugMode) print("PLANS & PACKAGES GOTTEN successfully");
        // all data
        allPlansList.assign(PlanResponseModel.fromJson(response.body));
        // all plans
        actualPlansList.assignAll(allPlansList.last.plans!);
        // all packages
        allPackagesList.assignAll(allPlansList.last.categories!);

        if (kDebugMode) print("PLANS $actualPlansList");
        if (kDebugMode) print("PACKAGES $allPackagesList");
      } else {
        isLoading.value = false;
        if (kDebugMode) print("Failed To Get PLANS");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("GET PLANS ERROR: $e");
    }
  }

  // fetch plan histories
  Future<void> fetchPlanHistory() async {
    try {
      Response response = await _getConnect.get(
        BulloakAPI.getPlanHistoryEndpoint,
        headers: await myHeaders(),
      );

      if (kDebugMode) print("PLANS HISTORY: ${response.body}");
      if (kDebugMode) print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        isLoading.value = false;
        if (kDebugMode) print("PLAN HISTORY GOTTEN successfully");
        var dataList = <PlanHistoryModel>[];
        for (var a in response.body) {
          dataList.add(PlanHistoryModel.fromJson(a));
        }
        planHistoryList.assignAll(dataList);
        if (kDebugMode) print(planHistoryList);
      } else {
        isLoading.value = false;
        if (kDebugMode) print("Failed To Get PLAN History");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("GET PLAN HISTORY ERROR: $e");
    }
  }
}

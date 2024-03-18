import 'package:bulloak_fin_mgt_fin_mgt/models/user_dashboard_details_model.dart';
import 'package:bulloak_fin_mgt_fin_mgt/models/user_model.dart';
import 'package:bulloak_fin_mgt_fin_mgt/services/api_endpoints.dart';
import 'package:bulloak_fin_mgt_fin_mgt/services/helper_methods.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  final isLoading = false.obs;
  // late String stringResponse;

  // get connect
  final _getConnect = GetConnect();

  // user lists
  final allUsersList = <UserModel>[].obs;

  // user data

  // user dashboard data
  final userDashboardInfo = UserDashboardDetailsModel().obs;

  @override
  void onReady() {
    initDashboard();
    super.onReady();
  }

  Future<void> initDashboard() async {
    await getUserDashboardDetail();
  }

  // fetch user details: NOT USED
  Future<void> fetchUserDetail() async {
    final userInfo = UserModel().obs;
    // shared pref
    final shp = await SharedPreferences.getInstance();
    String? userSavedEmail = await shp.getString(EMAIL);

    try {
      Response response = await _getConnect.get(
        BulloakAPI.getUserEndpoint,
        headers: await myHeaders(),
      );

      if (kDebugMode) print("USERS DETAIL: ${response.body}");
      if (kDebugMode) print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        isLoading.value = false;
        if (kDebugMode) print("USERS Gotten successfully");

        for (var data in response.body[0]) {
          allUsersList.add(UserModel.fromJson(data));
        }

        for (var user in allUsersList) {
          if (user.user!.email == userSavedEmail!) {
            userInfo.value = user;
          }
        }

        userInfo.refresh();

        if (kDebugMode) print("USERS $allUsersList");
        if (kDebugMode) print("USER DETAIL $userInfo");
        if (kDebugMode) print("USER ID ${userInfo.value.id}");
      } else {
        isLoading.value = false;
        if (kDebugMode) print("Failed To Get USERS");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("GET USERS ERROR: $e");
    }
  }

  // fetch user details
  Future<void> getUserDashboardDetail() async {
    try {
      Response response = await _getConnect.get(
        BulloakAPI.getUserDashboardDetail,
        headers: await myHeaders(),
      );

      if (kDebugMode) print("USER DASHBOARD DETAIL: ${response.body}");
      if (kDebugMode) print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        if (kDebugMode) print("USER DASHBOARD Gotten successfully");

        var decoded = UserDashboardDetailsModel.fromJson(response.body);
        userDashboardInfo.value = decoded;
        userDashboardInfo.refresh();

        if (kDebugMode) print("USERS DASHBOARD $userDashboardInfo");
        if (kDebugMode) print("Profile: ${userDashboardInfo.value.profile}");
      } else {
        isLoading.value = false;
        if (kDebugMode) print("Failed To Get USER DASHBOARD");
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("GET USER DASHBOARD ERROR: $e");
    }
  }
}

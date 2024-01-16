import 'package:bulloak_fin_mgt_fin_mgt/controllers/transaction_controller.dart';
import 'package:get/get.dart';
import 'package:bulloak_fin_mgt_fin_mgt/controllers/auth_controller.dart';
import 'package:bulloak_fin_mgt_fin_mgt/controllers/dashboard_controller.dart';
import 'package:bulloak_fin_mgt_fin_mgt/controllers/plan_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(PlanController());
    Get.put(TransactionController());
    Get.put(DashboardController());
  }
}

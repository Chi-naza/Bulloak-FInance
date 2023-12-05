import 'package:bulloak_fin_mgt_fin_mgt/services/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  final isLoading = false.obs;
  late String stringResponse;

  @override
  void onReady() {
    fetchUserData();
    super.onReady();
  }

  Future fetchUserData() async {
    http.Response response;
    response = await http.get(Uri.parse(BulloakAPI.userEndPoint));
    if (response.statusCode == 200) {
      print(response);
    }
  }
}

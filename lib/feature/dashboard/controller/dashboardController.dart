import 'dart:convert';

import 'package:coffeharvest/feature/auth/controller/loginController.dart';
import 'package:coffeharvest/feature/dashboard/repository/dashboardRepository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardController extends GetxController {
  final dashboardRepo = DashboardRepository();
  final box = GetStorage();

  var farmers = 4.obs;
  var harvest = 0.obs;
  var payments = 2.obs;
  var loading = false.obs;

  filter(String date) => {this.loadData(date.toString())};
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData(" ");
  }

  loadData(date) async {
    loading(true);
    var phone = box.read("phone");
    try {
      var response = await dashboardRepo.loadData(phone, date);
      var data = jsonEncode(response.data);
      var fmvalue = jsonDecode(data.toString())["farmer"];
      var hvvalue = jsonDecode(data.toString())["harvest"];
      var payvalue = jsonDecode(data.toString())["payments"];
      farmers(fmvalue);
      harvest(hvvalue);
      payments(payvalue);
      print(harvest);
      print(fmvalue);
    } on DioError catch (error) {
      if (error.response?.statusCode == 403) {
        Get.snackbar(
            "Message", jsonDecode(error.response.toString())["message"],
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      loading(false);
    }
  }
}

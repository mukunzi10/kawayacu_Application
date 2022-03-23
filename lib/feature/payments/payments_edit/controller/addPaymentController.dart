import 'dart:convert';

import 'package:coffeharvest/feature/farmer/farmers/controller/farmersController.dart';
import 'package:coffeharvest/feature/payments/payments/controller/paymentsController.dart';
import 'package:coffeharvest/feature/payments/repository/paymentRepository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AddPaymentController extends GetxController {
  final paymentRepo = PaymentRepository();

  final paymentController = Get.find<PaymentsController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(Get.arguments["firstname"]);
    farmerNames = Get.arguments["firstname"] + " " + Get.arguments["lastname"];
    farmerId = Get.arguments["id"];
  }

  var amountTextController = "".obs;
  var amountError = "".obs;
  var submitting = false.obs;
  var farmerNames = "";
  var farmerId = 0;

  setQuantity(value) => amountTextController(value);
  resetErrors() => {amountError("")};

  validate() {
    if (amountTextController.value.trim().isEmpty) {
      return amountError("Amount is required!");
    } else {
      resetErrors();
      return submit();
    }
  }

  submit() async {
    submitting(true);
    try {
      var response = await paymentRepo.register(
          farmerId.toString(), amountTextController.toString());
      Get.snackbar("Message", "Successfull Done",
          snackPosition: SnackPosition.BOTTOM);
      paymentController.loadData();
      Get.toNamed("homepage");
    } on DioError catch (error) {
      print(error.response);
      if (error.response?.statusCode == 403) {
        Get.snackbar("Error", jsonDecode(error.response.toString())["message"],
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      submitting(false);
    }
  }
}

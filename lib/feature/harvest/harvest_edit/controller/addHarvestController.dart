import 'dart:convert';

import 'package:coffeharvest/feature/farmer/farmers/controller/farmersController.dart';
import 'package:coffeharvest/feature/harvest/harvests/controller/harvestController.dart';
import 'package:coffeharvest/feature/harvest/repository/harvestRepository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddHarvestController extends GetxController {
  final farmersController = Get.find<FamersController>();
  final harvestRepo = HarvestRepository();
  final harvestController = Get.find<HarvestController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listOfFarmers = farmersController.farmersList;
    debounce(quantityTextController, (_) {
      calculateTotalPrice(quantityTextController);
    });
  }

  var quantityTextController = "".obs;
  var submitting = false.obs;
  var totalprice = 0.obs;
  String? selectedFarmer;
  var listOfFarmers = [].obs;
  var selectedFarmerError = "".obs;
  var quantityError = "".obs;

  setQuantity(value) => quantityTextController(value);
  resetErrors() => {selectedFarmerError(""), quantityError("")};

  validate() {
    if (selectedFarmer == null) {
      return selectedFarmerError("Select Farmer !");
    } else if (quantityTextController.value.trim().isEmpty) {
      return quantityError("Quantity is required!");
    } else {
      resetErrors();
      return submit();
    }
  }

  setSelected(var value) => {selectedFarmer = value, update()};

  calculateTotalPrice(quantityTextController) {
    if (!quantityTextController.value.trim().isEmpty) {
      var total = int.parse(quantityTextController.value) * 100;
      totalprice(total);
    } else {
      totalprice(0);
    }
  }

  submit() async {
    submitting(true);
    try {
      var response = await harvestRepo.register(
          selectedFarmer.toString(), quantityTextController.toString());
      Get.snackbar("Message", "Successfull Done",
          snackPosition: SnackPosition.BOTTOM);
      harvestController.loadData();
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

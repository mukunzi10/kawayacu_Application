import 'dart:convert';

import 'package:coffeharvest/feature/auth/controller/loginController.dart';
import 'package:coffeharvest/feature/farmer/farmers/controller/farmersController.dart';
import 'package:coffeharvest/feature/farmer/repository/farmerRepository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddFarmerController extends GetxController {
  final farmerRepo = FamerRepository();
  final loginController = Get.find<LoginController>();
  final farmerController = Get.find<FamersController>();
  final box = GetStorage();

  var firstNameTextController = "";
  var lastNameTextController = "";
  var phoneTextController = "";
  var submitting = false.obs;
  String? selectedGender;
  var listOfOptions = ['Male', 'Female'];

  var selectedGenderError = "".obs;
  var firstNameError = "".obs;
  var lastNameError = "".obs;
  var phoneError = "".obs;

  setFirstname(value) => firstNameTextController = value;
  setLastname(value) => lastNameTextController = value;
  setPhone(value) => phoneTextController = value;
  setSelected(var value) => {selectedGender = value, update()};
  resetErrors() => {
        selectedGenderError(""),
        firstNameError(""),
        phoneError(),
        selectedGenderError()
      };

  validate() {
    if (firstNameTextController.trim().isEmpty) {
      return firstNameError("FirstName is required!");
    } else if (lastNameTextController.trim().isEmpty) {
      return lastNameError("LastName is required!");
    } else if (selectedGender == null) {
      return selectedGenderError("Select Gender !");
    } else if (phoneTextController.trim().isEmpty) {
      return phoneError("Phone is required!");
    } else {
      resetErrors();
      return submit();
    }
  }

  submit() async {
    submitting(true);
    final userPhone = box.read("phone");
    print(userPhone);
    try {
      var response = await farmerRepo.register(
          firstNameTextController,
          lastNameTextController,
          selectedGender,
          phoneTextController,
          userPhone);
      Get.snackbar("Message", "Successfull Done",
          snackPosition: SnackPosition.BOTTOM);
      farmerController.loadData();
      Get.toNamed("homepage");
    } on DioError catch (error) {
      if (error.response?.statusCode == 403) {
        Get.snackbar("Error", jsonDecode(error.response.toString())["message"],
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      submitting(false);
    }
  }
}

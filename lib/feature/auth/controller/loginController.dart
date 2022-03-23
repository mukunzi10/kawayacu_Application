import 'dart:convert';
import 'package:coffeharvest/feature/auth/repository/authRepository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkIfAuthenticated();
  }

  final box = GetStorage();
  final authRep = AuthRepository();
  var phoneTextController = '';
  var passwordTextController = "";

  // for change password

  var passTextController = '';
  var confirmPassTextController = "";

  RxBool submitting = false.obs;
  RxString phoneError = "".obs;
  RxString passwordError = "".obs;
  var authenticated = false.obs;
  var authenticatedUserData = {}.obs;

  setPhone(value) => {phoneTextController = value};
  resetErrors() => {phoneError(""), passwordError("")};
  setPassword(value) => passwordTextController = value;
  setAuthenticated() => authenticated(true);
  setAuthUserData(value) => authenticatedUserData(value);

  setPass(value) => passTextController = value;
  setConfirmPass(value) => confirmPassTextController = value;

  validation() {
    if (phoneTextController.trim().isEmpty) {
      return phoneError("Phone is required!");
    } else if (passwordTextController.trim().isEmpty) {
      return passwordError("Password is required!");
    } else {
      resetErrors();
      return login();
    }
  }

  login() async {
    submitting(true);
    try {
      var response =
          await authRep.login(phoneTextController, passwordTextController);
      var data = jsonEncode(response.data);
      var userData = jsonDecode(data)["data"];
      setAuthenticated();
      setAuthUserData(userData);
      box.write("phone", userData["phone"]);
      Get.offNamed("homepage");
    } on DioError catch (error) {
      if (error.response?.statusCode == 403) {
        Get.snackbar("Error", jsonDecode(error.response.toString())["message"],
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      submitting(false);
    }
  }

  logout() {
    Get.offNamed('login');
  }

  checkIfAuthenticated() {
    print("is checking");
  }

  change() async
  {
    if(passTextController!=confirmPassTextController)
    {
      Get.snackbar("Error","Password does not match",snackPosition: SnackPosition.BOTTOM);
    }
    else
    {
         submitting(true);
    try {
      var phone = box.read("phone");
          var response =
              await authRep.change(phone, passTextController);
          Get.toNamed('/login');
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
  back()
  {
    Get.toNamed("/homepage");
  }
}

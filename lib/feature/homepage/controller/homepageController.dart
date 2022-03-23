import 'package:coffeharvest/feature/auth/controller/loginController.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  int currentIndex = 0;
  final loginController = Get.find<LoginController>();

  setCurrentIndex(index) => {currentIndex = index, update()};
  callLogout() => {
        currentIndex = 0,
        loginController.logout(),
        update(),
      };
}

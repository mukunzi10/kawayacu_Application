import 'package:coffeharvest/feature/auth/controller/loginController.dart';
import 'package:coffeharvest/feature/harvest/harvest_edit/controller/addHarvestController.dart';
import 'package:get/get.dart';

class AddHarvestBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AddHarvestController());
  }
}

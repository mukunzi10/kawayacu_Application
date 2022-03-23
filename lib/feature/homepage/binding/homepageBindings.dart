import 'package:coffeharvest/feature/dashboard/controller/dashboardController.dart';
import 'package:coffeharvest/feature/farmer/farmers/controller/farmersController.dart';
import 'package:coffeharvest/feature/harvest/harvests/controller/harvestController.dart';
import 'package:coffeharvest/feature/homepage/controller/homepageController.dart';
import 'package:coffeharvest/feature/payments/payments/controller/paymentsController.dart';
import 'package:get/get.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HarvestController());
    Get.lazyPut(() => FamersController());
    Get.lazyPut(() => PaymentsController());
  }
}

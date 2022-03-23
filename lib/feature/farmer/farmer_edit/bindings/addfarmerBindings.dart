import 'package:coffeharvest/feature/farmer/farmer_edit/controller/addfarmersController.dart';
import 'package:coffeharvest/feature/farmer/farmers/controller/farmersController.dart';
import 'package:coffeharvest/feature/harvest/harvest_edit/controller/addHarvestController.dart';
import 'package:get/get.dart';

class AddFarmerBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AddFarmerController());
  }
}

import 'package:coffeharvest/feature/payments/payments_edit/controller/addPaymentController.dart';
import 'package:get/get.dart';

class PaymentBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AddPaymentController());
  }
}

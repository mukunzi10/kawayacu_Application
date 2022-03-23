import 'dart:convert';
import 'package:coffeharvest/feature/payments/repository/paymentRepository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PaymentsController extends GetxController {
  final paymentRepo = PaymentRepository();
  var paymentList = [].obs;
  var copyData = [].obs;
  var queryTosearch = "".obs;
  var loading = false.obs;
  final box = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    debounce(
      queryTosearch,
      (_) => filterData(),
    );
    loadData();
  }
  setQuery(String value) => queryTosearch(value);
  loadData() async {
    loading(true);
    var phone = box.read("phone");
    try {
      var response = await paymentRepo.payments(phone);
      var data = jsonEncode(response.data);
      var finalResp = jsonDecode(data.toString())["data"];
      paymentList(finalResp);
    } on DioError catch (error) {
      if (error.response?.statusCode == 403) {
        Get.snackbar("Message", jsonDecode(error.response.toString())["message"],
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      loading(false);
    }
  }
      filterData() {
    var result = paymentList.where((element) =>element['farmer_firstname'].toString().contains(queryTosearch.value)).toList();
    print(queryTosearch.value);
    loading(true);
    paymentList(copyData);
    update();
    if(result.length>0)
    {
        paymentList(result);
        loading(false);
        update();
    }

  }
}

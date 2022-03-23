import 'dart:convert';
import 'package:coffeharvest/feature/harvest/repository/harvestRepository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HarvestController extends GetxController {
  final harvestRepo = HarvestRepository();
  var harvestList = [].obs;
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
      (_) =>  filterData(),
    );
    loadData();
  }

  setQuery(String value) => queryTosearch(value);

  loadData() async {
    loading(true);
    var phone = box.read("phone");
    try {
      var response = await harvestRepo.harvests(phone);
      var data = jsonEncode(response.data);
      var finalResp = jsonDecode(data.toString())["data"];
      copyData(finalResp);
      harvestList(finalResp);
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
    var result = harvestList.where((element) =>element['farmer_firstname'].toString().contains(queryTosearch.value)).toList();
    print(queryTosearch.value);
    loading(true);
    harvestList(copyData);
    update();
    if(result.length>0)
    {
        harvestList(result);
        loading(false);
        update();
    }

  }
}

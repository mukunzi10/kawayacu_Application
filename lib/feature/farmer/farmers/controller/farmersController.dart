import 'dart:convert';
import 'package:coffeharvest/feature/farmer/repository/farmerRepository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FamersController extends GetxController {
  final farmerRepo = FamerRepository();

  var farmersList = [].obs;
  var copyData=[].obs;
  var queryTosearch = "".obs;
  var loading = false.obs;
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

  final box = GetStorage();
  setQuery(String value) => queryTosearch(value);

  loadData() async {
    loading(true);
    var phone = box.read("phone");
    try {
      var response = await farmerRepo.farmers(phone);
      var data = jsonEncode(response.data);
      var finalResp = jsonDecode(data.toString())["data"];
      farmersList(finalResp);
      copyData(finalResp);
      

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
    var result = farmersList.where((element) =>element['farmer_firstname'].toString().contains(queryTosearch.value)).toList();
    print(queryTosearch.value);
    loading(true);
    farmersList(copyData);
    update();
    if(result.length>0)
    {
        farmersList(result);
        loading(false);
        update();
    }

  }
}

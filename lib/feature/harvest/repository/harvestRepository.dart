import 'package:coffeharvest/services/apiServices.dart';
import 'package:dio/dio.dart';

class HarvestRepository {
  var dio = Dio();

  harvests(var phone) async {
    var response;
    var url = ApiServices().baseUrl + "harvest";
    response = await dio.get(url, queryParameters: {"phone": phone});
    return response;
  }

  register(var farmer, quantity) async {
    var response;
    var url = ApiServices().baseUrl + "addHarvest";

    response = await dio.post(url, data: {
      'farmer': farmer,
      'quantity': quantity,
    });
    return response;
  }

  void init() {
    dio.options.baseUrl = "";
    dio.options.headers = {'Accept': 'application/json'};
  }
}

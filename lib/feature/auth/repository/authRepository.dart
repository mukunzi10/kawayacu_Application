import 'package:coffeharvest/services/apiServices.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  var dio = Dio();

  login(var phone, password) async {
    var response;
    var url = ApiServices().baseUrl + "login";

    response =
        await dio.post(url, data: {'phone': phone, 'password': password});
    return response;
  }
  change(var phone, password) async {
    var response;
    var url = ApiServices().baseUrl + "changePassword";

    response =
        await dio.post(url, data: {'phone': phone, 'password': password});
    return response;
  }

  void init() {
    dio.options.baseUrl = "";
    dio.options.headers = {'Accept': 'application/json'};
  }
}

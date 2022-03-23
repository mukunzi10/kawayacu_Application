import 'package:coffeharvest/services/apiServices.dart';
import 'package:dio/dio.dart';

class DashboardRepository {
  var dio = Dio();

  loadData(var phone,date) async {
    var response;
    var url = ApiServices().baseUrl + "sitereport?phone=$phone";
    response = await dio.get(url);
    return response;
  }

  void init() {
    dio.options.baseUrl = "";
    dio.options.headers = {'Accept': 'application/json'};
  }
}

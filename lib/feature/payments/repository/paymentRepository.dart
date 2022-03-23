import 'package:coffeharvest/services/apiServices.dart';
import 'package:dio/dio.dart';

class PaymentRepository {
  var dio = Dio();

  payments(var phone) async {
    var response;
    var url = ApiServices().baseUrl + "balance/$phone";
    response = await dio.get(url, queryParameters: {"phone": phone});
    return response;
  }

  register(var farmer, amount) async {
    var response;
    var url = ApiServices().baseUrl + "addpayment";
    response = await dio.post(url, data: {
      'farmer': farmer,
      'amount': amount,
    });
    return response;
  }

  void init() {
    dio.options.baseUrl = "";
    dio.options.headers = {'Accept': 'application/json'};
  }
}

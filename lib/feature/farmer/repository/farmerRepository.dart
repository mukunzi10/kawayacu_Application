import 'package:coffeharvest/services/apiServices.dart';
import 'package:dio/dio.dart';

class FamerRepository {
  var dio = Dio();

  farmers(var phone) async {
    var response;
    var url = ApiServices().baseUrl + "farmers/$phone";
    response = await dio.get(url);
    return response;
  }

  register(var firstname, lastname, gender, phone, agentPhone) async {
    var response;
    var url = ApiServices().baseUrl + "addfarmer";

    response = await dio.post(url, data: {
      'phone': phone,
      'gender': gender,
      'firstname': firstname,
      'lastname': lastname,
      'agent_phone': agentPhone
    });
    return response;
  }

  void init() {
    dio.options.baseUrl = "";
    dio.options.headers = {'Accept': 'application/json'};
  }
}

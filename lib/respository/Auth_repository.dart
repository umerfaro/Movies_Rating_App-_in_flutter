import 'package:mvvm_architechture/Data/network/NetworkApiServices.dart';

import '../Data/network/Base_APi_services.dart';
import '../resources/App_Urls.dart';

class AuthRepository {
  BaseApiServices _baseApiServices = NetworkApiServices();

  Future<dynamic> LoginAPI(dynamic data) async {
    try {
      dynamic response =
          await _baseApiServices.getPostApiResponse(AppUrl.LoginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerAPI(dynamic data) async {
    try {
      dynamic response =
      await _baseApiServices.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

}

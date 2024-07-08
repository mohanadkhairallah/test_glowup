import 'package:dartz/dartz.dart';

import '../../models/login_response.dart';
import '../../models/params/login_params.dart';
import '../local_resource/data_store.dart';
import '../remote_data/api_const.dart';
import '../remote_data/api_handler/base_api_client.dart';

class UserRepository {
  Future<Either<String, LoginResponse>> logIn(
      {LoginParams? loginParams}) async {
    return BaseApiClient.post<LoginResponse>(
        url: ApiConst.login,
        formData: loginParams?.toJson(),
        converter: (e) {
          return LoginResponse.fromJson(e["content"]);
        });
  }

  void deleteToken() async {
    DataStore.instance.deleteToken();
  }

  Future<bool> hasToken() async {
    return DataStore.instance.hasToken;
  }

  void saveToken(String token) {
    DataStore.instance.setToken(token);
  }
}

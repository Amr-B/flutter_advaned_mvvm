// ignore_for_file: non_constant_identifier_names

import 'package:advanced_flutter_tutorial/data/network/app_api.dart';
import 'package:advanced_flutter_tutorial/data/network/requests.dart';
import 'package:advanced_flutter_tutorial/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }
}

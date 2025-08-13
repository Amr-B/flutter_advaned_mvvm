// ignore_for_file: prefer_final_fields

import 'package:advanced_flutter_tutorial/data/data_source/remote_data_source.dart';
import 'package:advanced_flutter_tutorial/data/mapper/mapper.dart';
import 'package:advanced_flutter_tutorial/data/network/failure.dart';
import 'package:advanced_flutter_tutorial/data/network/network_info.dart';
import 'package:advanced_flutter_tutorial/data/network/requests.dart';
import 'package:advanced_flutter_tutorial/domain/model/models.dart';
import 'package:advanced_flutter_tutorial/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, AuthObject>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      final response = await _remoteDataSource.login(loginRequest);

      if (response.status == 0) {
        return Right(response.toDomain());
      } else {
        // failure
        return Left(Failure(409, response.message ?? "API ERROR"));
      }
    } else {
      return Left(Failure(501, "check connection"));
    }
  }
}

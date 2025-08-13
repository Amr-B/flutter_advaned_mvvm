// ignore_for_file: prefer_final_fields

import 'package:advanced_flutter_tutorial/data/data_source/remote_data_source.dart';
import 'package:advanced_flutter_tutorial/data/mapper/mapper.dart';
import 'package:advanced_flutter_tutorial/data/network/error_handler.dart';
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
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          // failure
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}

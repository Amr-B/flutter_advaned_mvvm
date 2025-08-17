// ignore_for_file: override_on_non_overriding_member

import 'package:advanced_flutter_tutorial/data/network/failure.dart';
import 'package:advanced_flutter_tutorial/data/network/requests.dart';
import 'package:advanced_flutter_tutorial/domain/model/models.dart';
import 'package:advanced_flutter_tutorial/domain/repository/repository.dart';
import 'package:advanced_flutter_tutorial/domain/usecase/base_use_case.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, AuthObject> {
  @override
  final Repository _repository;
  LoginUseCase(this._repository);
  Future<Either<Failure, AuthObject>> excute(LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(this.email, this.password);
}

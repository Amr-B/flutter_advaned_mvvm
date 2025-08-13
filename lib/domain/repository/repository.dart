import 'package:advanced_flutter_tutorial/data/network/requests.dart';
import 'package:advanced_flutter_tutorial/domain/model/models.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, AuthObject>> login(LoginRequest loginRequest);
}

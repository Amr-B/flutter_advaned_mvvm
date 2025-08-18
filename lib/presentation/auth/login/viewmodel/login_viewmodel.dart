// ignore_for_file: prefer_final_fields, unused_field

import 'dart:async';

import 'package:advanced_flutter_tutorial/data/network/failure.dart';
import 'package:advanced_flutter_tutorial/presentation/base/base_view_model.dart';

import '../../../../domain/usecase/login_use_case.dart';
import '../../../common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewmodelOutputs {
  StreamController _userNameStreamController =
      StreamController<String>.broadcast();

  StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  var loginObject = LoginObject("", "");

  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {}

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUsername => _userNameStreamController.sink;

  @override
  login() async {
    (await _loginUseCase.excute(
            LoginUseCaseInput(loginObject.username, loginObject.password)))
        .fold(
            (failure) => {
                  // > left --> failure
                  print(failure.message)

                  // > right -- > data success
                },
            (data) => {print(data.customer?.name)});
  }

  // > outputs
  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
  }

  @override
  setUsername(String username) {
    inputUsername.add(username);
    loginObject = loginObject.copyWith(username: username);
  }
}

mixin LoginViewModelInputs {
  setUsername(String username);
  setPassword(String password);
  login();

  Sink get inputUsername;
  Sink get inputPassword;
}

mixin LoginViewmodelOutputs {
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
}

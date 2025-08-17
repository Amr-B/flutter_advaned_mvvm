import 'package:advanced_flutter_tutorial/presentation/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewmodelOutputs {
  @override
  void dispose() {}

  @override
  void start() {}

  @override
  Sink get inputPassword => throw UnimplementedError();

  @override
  Sink get inputUsername => throw UnimplementedError();

  @override
  login() {
    throw UnimplementedError();
  }

  // > outputs
  @override
  Stream<bool> get outIsPasswordValid => throw UnimplementedError();

  @override
  Stream<bool> get outIsUserNameValid => throw UnimplementedError();

  @override
  setPassword(String password) {
    // TODO: implement setPassword
    throw UnimplementedError();
  }

  @override
  setUsername(String username) {
    // TODO: implement setUsername
    throw UnimplementedError();
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

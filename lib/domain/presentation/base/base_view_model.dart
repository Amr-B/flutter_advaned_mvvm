abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // > shared vars and funcs
}

abstract class BaseViewModelInputs {
  void start(); // > start view model

  void dispose();
}

mixin BaseViewModelOutputs {
  // > will be implemented later
}

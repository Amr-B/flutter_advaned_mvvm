import 'dart:async';

import 'package:advanced_flutter_tutorial/domain/models.dart';
import 'package:advanced_flutter_tutorial/presentation/base/base_view_model.dart';

class OnboardingViewmodel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // > OnBoarding ViewModel Inputs
  StreamController _streamController = StreamController<SliderViewObject>();
  @override
  void start() {
    // TODO: implement start
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

  @override
  // TODO: implement inputSLiderViewObject
  Sink get inputSLiderViewObject => throw UnimplementedError();

  @override
  // TODO: implement outputSliderViewObject
  Stream get outputSliderViewObject => throw UnimplementedError();
}

mixin OnBoardingViewModelInputs {
  void goNext();
  void goPrevious();
  void onPageChanged(int index);

  // > stream controller
  Sink get inputSLiderViewObject;
}

mixin OnBoardingViewModelOutputs {
  // future output methods or properties
  Stream get outputSliderViewObject;
}

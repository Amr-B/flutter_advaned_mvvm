// ignore_for_file: void_checks

import 'dart:async';
import 'dart:ffi';

import 'package:advanced_flutter_tutorial/domain/model/models.dart';
import 'package:advanced_flutter_tutorial/presentation/base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/usecase/store_details_usecase.dart';
import '../common/state_renderer/state_renderer.dart';
import '../common/state_renderer/state_renderer_impl.dart';

class StoreDetailsViewModel extends BaseViewModel
    with StoreDetailsViewModelInput, StoreDetailsViewModelOutput {
  final _storeDetailsStreamController = BehaviorSubject<StoreDetails>();

  final StoreDetailsUseCase storeDetailsUseCase;

  StoreDetailsViewModel(this.storeDetailsUseCase);

  @override
  start() async {
    _loadData();
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await storeDetailsUseCase.execute(Void)).fold(
      (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
      (storeDetails) async {
        inputState.add(ContentState());
        inputStoreDetails.add(storeDetails);
      },
    );
  }

  @override
  void dispose() {
    _storeDetailsStreamController.close();
  }

  @override
  Sink get inputStoreDetails => _storeDetailsStreamController.sink;

  //output
  @override
  Stream<StoreDetails> get outputStoreDetails =>
      _storeDetailsStreamController.stream.map((stores) => stores);
}

mixin StoreDetailsViewModelInput {
  Sink get inputStoreDetails;
}

mixin StoreDetailsViewModelOutput {
  Stream<StoreDetails> get outputStoreDetails;
}

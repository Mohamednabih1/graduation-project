import 'dart:async';

import 'package:gradproject/presentation/ui/common/state_renderer/state_renderer_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // shared variable and functions will be used through any model
  late final StreamController<FlowState> _inputStreamController;

  @override
  void destroy() {
    _inputStreamController.close();
  }

  @override
  Sink<FlowState> get inputState => _inputStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      _inputStreamController.stream.map((flowState) => flowState);
}

abstract class BaseViewModelInputs {
  void start(); // start view model job
  void destroy(); // will be called when view model dies

  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}

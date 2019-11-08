import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RTEditState> buildReducer() {
  return asReducer(
    <Object, Reducer<RTEditState>>{
//      Lifecycle.initState: _init,
    },
  );
}

RTEditState _init(RTEditState state, Action action) {
  final RTEditState newState = state.clone();
  print("Init State ${state.rt}");
  return newState;
}

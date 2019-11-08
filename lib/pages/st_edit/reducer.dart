import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<STEditState> buildReducer() {
  return asReducer(
    <Object, Reducer<STEditState>>{
//      STEditAction.action: _onAction,
    },
  );
}

STEditState _onAction(STEditState state, Action action) {
  final STEditState newState = state.clone();
  return newState;
}

import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SrcState> buildReducer() {
  return asReducer(
    <Object, Reducer<SrcState>>{
      SrcAction.action: _onAction,
    },
  );
}

SrcState _onAction(SrcState state, Action action) {
  final SrcState newState = state.clone();
  return newState;
}

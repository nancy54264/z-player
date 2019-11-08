import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DrawerState> buildReducer() {
  return asReducer(
    <Object, Reducer<DrawerState>>{
      DrawerAction.action: _onAction,
    },
  );
}

DrawerState _onAction(DrawerState state, Action action) {
  final DrawerState newState = state.clone();
  return newState;
}

import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
//      HomeAction.initRts: _initRts,
    },
  );
}

//HomeState _initRts(HomeState state, Action action) {
//  final List<RTState> rts = action.payload ?? <RTState>[];
//  final HomeState newState = state.clone();
//  newState.rts = rts;
//  return newState;
//}

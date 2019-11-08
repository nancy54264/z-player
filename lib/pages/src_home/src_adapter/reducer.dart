import 'package:zplayer/pages/src_home/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';


Reducer<SrcHomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<SrcHomeState>>{
      SrcListAction.add: _add,
    },
  );
}

SrcHomeState _add(SrcHomeState state, Action action) {
  SrcHomeState newState = state.clone();
  newState.srcList.addAll(action.payload);
  return newState;
}

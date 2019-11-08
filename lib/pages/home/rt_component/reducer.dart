import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RTState> buildReducer() {
  return asReducer(
    <Object, Reducer<RTState>>{
      RTAction.edit: _edit
    },
  );
}

RTState _edit(RTState state, Action action){
  final RTState rt = action.payload;
  if(state.id == rt.id){
    return state.clone()
      ..title = rt.title
      ..desc = rt.desc
      ..uri = rt.uri;
  }
  return state;
}


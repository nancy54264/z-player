import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<STState> buildReducer() {
  return asReducer(
    <Object, Reducer<STState>>{
      STAction.edit: _edit,
    },
  );
}

STState _edit(STState state, Action action) {
  final STState st = action.payload;
  if(state.id == st.id){
    return state.clone()
      ..title = st.title
      ..desc = st.desc
//      ..uri = st.uri
//      ..httpApi = st.httpApi
      ..httpsApi = st.httpsApi;
  }
  return state;
}

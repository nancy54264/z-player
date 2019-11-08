import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Reducer<AppState> buildReducer() {
  return asReducer(
    <Object, Reducer<AppState>>{
      AppAction.init: _init,
      AppAction.changePage: _changePage,
      AppAction.closeSplash: _closeSplash,
      AppAction.firstOpen: _firstOpen
    },
  );
}

AppState _init(AppState state, Action action) {
  final AppState newState = state.clone()
    ..theme = action.payload.theme
    ..firstOpen = action.payload.firstOpen
  ;
  return newState;
}

AppState _changePage(AppState state, Action action){
  return state.clone()
    ..pageIndex = action.payload;
}

AppState _closeSplash(AppState state, Action action){

  return state.clone()
      ..splash = false
  ;
}

AppState _firstOpen(AppState state, Action action){
  return state.clone()
      ..firstOpen = false
  ;
}
//import 'package:zplayer/global/static/themes.dart';
import 'package:fish_redux/fish_redux.dart';
import '../static/themes.dart';
import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.action: _onAction,
      GlobalAction.changeTheme: _changeTheme
    },
  );
}

GlobalState _onAction(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  return newState;
}

GlobalState _changeTheme(GlobalState state, Action action){
  print("change theme");
  final GlobalState newState = state.clone();

  newState
    ..theme = ThemeStore.getTheme(action.payload);

  return newState;
}

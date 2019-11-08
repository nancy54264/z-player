import 'package:zplayer/global/application.dart';
import 'package:zplayer/global/store/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ThemeState> buildEffect() {
  return combineEffects(<Object, Effect<ThemeState>>{
    ThemeAction.action: _onAction,
    ThemeAction.onchangeTheme: _onChangeTheme
  });
}

void _onAction(Action action, Context<ThemeState> ctx) {

}

void _onChangeTheme(Action action, Context<ThemeState> ctx){
  Application.localStorage.putString("theme", action.payload).then((b){
    if(b){
      Application.store.dispatch(GlobalActionCreator.onChangeTheme(action.payload));
    }else{
      print("change theme failed!");
    }
  });

}
import 'package:zplayer/pages/app/state.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AppAction { action, changeTheme, init, changePage, closeSplash, firstOpen }

class AppActionCreator {
  static Action onAction() {
    return const Action(AppAction.action);
  }

  static Action onChangeTheme(String series){
    return Action(AppAction.changeTheme, payload: series);
  }

  static Action init(AppState state){
    return Action(AppAction.init, payload: state);
  }

  static Action changePageAction(int index){
    return Action(AppAction.changePage, payload: index);
  }

  static Action closeSplashAction(){
    return const Action(AppAction.closeSplash);
  }

  static Action firstOpenAction(){
    return const Action(AppAction.firstOpen);
  }
}

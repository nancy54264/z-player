import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GlobalAction { action, changeTheme }

class GlobalActionCreator {
  static Action onAction() {
    return const Action(GlobalAction.action);
  }

  static Action onChangeTheme(String series){
    return Action(GlobalAction.changeTheme, payload: series);
  }
}

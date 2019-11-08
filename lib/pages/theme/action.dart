import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ThemeAction { action, onchangeTheme }

class ThemeActionCreator {
  static Action onAction() {
    return const Action(ThemeAction.action);
  }

  static Action onChangeTheme(String series){
    return Action(ThemeAction.onchangeTheme, payload: series);
  }
}

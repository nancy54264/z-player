import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SrcAction { action, onPlayer}

class SrcActionCreator {
  static Action onAction() {
    return const Action(SrcAction.action);
  }

  static Action onPlayerAction(){
    return const Action(SrcAction.onPlayer);
  }
}

import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum STEditAction { onSubmit }

class STEditActionCreator {

  static Action onSubmitAction(){
    return const Action(STEditAction.onSubmit);
  }
}

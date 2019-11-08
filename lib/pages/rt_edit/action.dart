import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RTEditAction { onSubmit }

class RTEditActionCreator {

  static Action onSubmitAction(){
    return const Action(RTEditAction.onSubmit);
  }
}

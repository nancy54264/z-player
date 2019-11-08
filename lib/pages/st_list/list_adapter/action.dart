import 'package:zplayer/pages/st_list/st_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum STListAction { action, add, top, init }

class STListActionCreator {
  static Action onAction() {
    return const Action(STListAction.action);
  }

  static Action add(STState st){
    return Action(STListAction.add, payload: st);
  }

  static Action top(int order){
    return Action(STListAction.top, payload: order);
  }

  static Action initAction(List<STState> sts){
    return Action(STListAction.init, payload: sts);
  }
}

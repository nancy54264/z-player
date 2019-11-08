import 'package:zplayer/pages/home/rt_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RTListAction { action, add, top, init }

class RTListActionCreator {
  static Action onAction() {
    return const Action(RTListAction.action);
  }

  /// 新增
  static Action add(RTState state){
    return Action(RTListAction.add, payload: state);
  }

  /// 置顶
  static Action top(int order){
    return Action(RTListAction.top, payload: order);
  }

  static Action initAction(List<RTState> rts){
    return Action(RTListAction.init, payload: rts);
  }
}

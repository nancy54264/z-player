import 'package:zplayer/pages/home/rt_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RTAction { action, edit, onEdit, onRemove, remove, top, onTop, onAdd, add, onPlayer}

class RTActionCreator {
  static Action onAction() {
    return const Action(RTAction.action);
  }

  static Action onTopAction(int order){
    return Action(RTAction.onTop, payload: order);
  }

  static Action topAction(int order){
    return Action(RTAction.top, payload: order);
  }

  static Action onRemoveAction(int id){
    return Action(RTAction.onRemove, payload: id);
  }

  static Action removeAction(int id){
    return Action(RTAction.remove, payload: id);
  }

  static Action onEditAction(int id){
    return Action(RTAction.onEdit, payload: id);
  }

  static Action editAction(RTState rt){
    return Action(RTAction.edit, payload: rt);
  }

  static Action onAddAction(){
    return Action(RTAction.onAdd);
  }

  static Action addAction(RTState rt){
    return Action(RTAction.add, payload: rt);
  }

  static Action onPlayerAction(){
    return const Action(RTAction.onPlayer);
  }
}

import 'package:zplayer/pages/st_list/st_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum STAction { action, edit, onEdit, onRemove, remove, top, onTop, onAdd, add, onClick }

class STActionCreator {
  static Action onAction() {
    return const Action(STAction.action);
  }

  static Action onTopAction(int order){
    return Action(STAction.onTop, payload: order);
  }

  static Action topAction(int order){
    return Action(STAction.top, payload: order);
  }

  static Action onRemoveAction(int id){
    return Action(STAction.onRemove, payload: id);
  }

  static Action removeAction(int id){
    return Action(STAction.remove, payload: id);
  }

  static Action onEditAction(int id){
    return Action(STAction.onEdit, payload: id);
  }

  static Action editAction(STState rt){
    return Action(STAction.edit, payload: rt);
  }

  static Action onAddAction(){
    return Action(STAction.onAdd);
  }

  static Action addAction(STState rt){
    return Action(STAction.add, payload: rt);
  }

  static Action onClickAction(){
    return const Action(STAction.onClick);
  }

}

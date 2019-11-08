import 'package:fish_redux/fish_redux.dart';
import 'pipe.dart';

//TODO replace with your own action
enum SrcHomeAction { action, init, onLoad, load, onSelectType, selectType,
  onKeyWard, kwyWord, clear, reset }

class SrcHomeActionCreator {
  static Action initAction(PageResponse response) {
    return Action(SrcHomeAction.init, payload: response);
  }

  static Action onLoadAction(){
    return const Action(SrcHomeAction.onLoad);
  }

  static Action loadAction(PageResponse response){
    return Action(SrcHomeAction.load, payload: response);
  }

  static Action onSelectTypeAction(Ty ty){
    return Action(SrcHomeAction.onSelectType, payload: ty);
  }

  static Action selectTypeAction(Ty ty){
    return Action(SrcHomeAction.onSelectType, payload: ty);
  }

  static Action onKeyWord(){
    return const Action(SrcHomeAction.onKeyWard);
  }

  static Action clearAction(){
    return Action(SrcHomeAction.clear);
  }
}

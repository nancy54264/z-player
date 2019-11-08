import 'package:fish_redux/fish_redux.dart';
import 'package:zplayer/pages/src_home/src_component/state.dart';

//TODO replace with your own action
enum SrcListAction { action, add}

class SrcListActionCreator {

  static Action addAction(List<SrcState> srcList){
    return Action(SrcListAction.add, payload: srcList);
  }
}

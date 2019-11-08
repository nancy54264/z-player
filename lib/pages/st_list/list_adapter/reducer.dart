import 'package:zplayer/pages/st_list/st_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import '../state.dart';
import '../st_component/action.dart' as st_action;
import 'action.dart';


Reducer<STHomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<STHomeState>>{
      st_action.STAction.top: _top,
      st_action.STAction.remove: _remove,
      st_action.STAction.add: _add,
      STListAction.init: _init
    },
  );
}

STHomeState _init(STHomeState state, Action action) {
  return state.clone()..sts = action.payload;
}

STHomeState _add(STHomeState state, Action action){
  final STState st = action.payload;

  return state.clone()
    ..sts = (state.sts.toList()..insert(state.sts.length -1, st));
}

STHomeState _top(STHomeState state, Action action){
  if(state.sts.isEmpty || state.sts.length <= 2){
    /// 如果列表为空或者列表长度小于2(有一个为 lock),则不执行该操作
    return state;
  }
  final int order = action.payload??0;
  STHomeState newState = state.clone();

  List<STState> list =  newState.sts
      .map<STState>((STState s){
    if(s.order == order){
      s.order = -1;
    }
    return s;
  }
  ).toList().map<STState>((STState s){
    if(s.order < order){
      s.order++;
    }
    return s;
  }).toList();

  list.sort((STState a, STState b){
    return a.order < b.order?0:1;
  });
  newState.sts = list;

  return newState;
}

STHomeState _remove(STHomeState state, Action action){
  int unlock = state.sts.where((STState s) => s.lock== false).length;
  if(unlock < 1){
    /// Dialog
    /// 最后一个不能删除
    return state;
  }

  return state.clone()
    ..sts = (state.sts.toList()
      ..removeWhere((STState s)=> s.id == action.payload));
}


import 'package:zplayer/pages/home/rt_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import '../state.dart';
import '../rt_component/action.dart' as rt_action;
import 'action.dart';


Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      rt_action.RTAction.top: _top,
      rt_action.RTAction.remove: _remove,
      rt_action.RTAction.add: _add,
      RTListAction.init: _init
    },
  );
}

HomeState _add(HomeState state, Action action){
  final RTState rt = action.payload;

  /// 获取非锁定状态下最大的 Node
//  RTState node = state.rts.where((RTState e) => e.lock == false)
//      .toList().reduce(
//          (RTState e1, RTState e2) => e1.order > e2.order?e1.clone():e2.clone()
//  );
//  rt.order = node.order + 1;

  return state.clone()
    ..rts = (state.rts.toList()..insert(state.rts.length -1, rt));
}

HomeState _top(HomeState state, Action action){
  if(state.rts.isEmpty || state.rts.length <= 2){
    /// 如果列表为空或者列表长度小于2(有一个为 lock),则不执行该操作
    return state;
  }
  final int order = action.payload??0;
  HomeState newState = state.clone();

  List<RTState> list =  newState.rts
      .map<RTState>((RTState s){
        if(s.order == order){
          s.order = -1;
        }
        return s;
      }
  ).toList().map<RTState>((RTState s){
    if(s.order < order){
      s.order++;
    }
    return s;
  }).toList();

  list.sort((RTState a, RTState b){
    return a.order < b.order?0:1;
  });
  newState.rts = list;

  return newState;
}

HomeState _remove(HomeState state, Action action){
  int unlock = state.rts.where((RTState s) => s.lock== false).length;
  if(unlock < 1){
    /// Dialog
    /// 最后一个不能删除
    return state;
  }

  return state.clone()
    ..rts = (state.rts.toList()
      ..removeWhere((RTState s)=> s.id == action.payload));
}

HomeState _init(HomeState state, Action action){
  return state.clone()..rts = action.payload;
}


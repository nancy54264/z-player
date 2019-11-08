import 'package:zplayer/pages/home/list_adapter/action.dart';
import 'package:zplayer/pages/home/rt_component/state.dart';
import 'package:zplayer/utils/sql.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
//    HomeAction.action: _onAction,
  });
}

void _init(Action action, Context<HomeState> ctx) async {
  List<Map<String, dynamic>> list = await Sql.setTable("rts").get();
  List<RTState>  rts = list.map((e)=>RTState.from(e)).toList();

  /// 有可能ID会自增到9999？需要限制一下
  rts.add(
      RTState(id: 9999, title: "add", uri: "add", desc: "add", order: 9999,
        lock: true)
  );
//  final List<RTState> rts = <RTState>[
//    RTState(id: 1, title: "CCTV-1", uri: "cctv", desc: "cctv1", order: 0),
//    RTState(id: 2, title: "CCTV-2", uri: "cctv", desc: "cctv2", order: 5),
//    RTState(id: 3, title: "CCTV-3", uri: "cctv", desc: "cctv3", order: 2),
//    RTState(id: 9999, title: "add", uri: "add", desc: "add", order: 9999,
//        lock: true),
//  ];
//
  rts.sort((RTState a, RTState b){
    return a.order < b.order?0:1;
  });

  ctx.dispatch(RTListActionCreator.initAction(rts));
}



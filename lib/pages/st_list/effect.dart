import 'package:zplayer/pages/st_list/list_adapter/action.dart';
import 'package:zplayer/pages/st_list/st_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:zplayer/utils/sql.dart';
import 'action.dart';
import 'state.dart';

Effect<STHomeState> buildEffect() {
  return combineEffects(<Object, Effect<STHomeState>>{
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<STHomeState> ctx) async{
  List<Map<String, dynamic>> list = await Sql.setTable("sts").get();
  List<STState> sts = list.map((e)=>STState.from(e)).toList();
  sts.add(
    STState(id: 9999, title: "add", order: 9999, lock: true)
  );

  sts.sort((STState a, STState b){
    return a.order < b.order?0:1;
  });

  ctx.dispatch(STListActionCreator.initAction(sts));
}

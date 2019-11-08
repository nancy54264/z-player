import 'package:zplayer/pages/st_list/st_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' show Navigator;
import 'action.dart';
import 'state.dart';

Effect<STEditState> buildEffect() {
  return combineEffects(<Object, Effect<STEditState>>{
    STEditAction.onSubmit: _onSubmit,
  });
}

void _onSubmit(Action action, Context<STEditState> ctx) {
  STState st = ctx.state.st.clone()
    ..title = ctx.state.titleController.text.trim()
    ..desc = ctx.state.descController.text.trim()
//    ..uri = ctx.state.uriController.text.trim()
//    ..httpApi = ctx.state.httpApiController.text.trim()
    ..httpsApi = ctx.state.httpsApiController.text.trim()
    ;

  Navigator.of(ctx.context).pop<STState>(st);
}

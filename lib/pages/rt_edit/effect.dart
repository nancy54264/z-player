import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';
import '../home/rt_component/state.dart';

Effect<RTEditState> buildEffect() {
  return combineEffects(<Object, Effect<RTEditState>>{
    RTEditAction.onSubmit: _onSubmit,

  });
}


void _onSubmit(Action action, Context<RTEditState> ctx){
  RTState rt = ctx.state.rt.clone()
    ..title = ctx.state.titleController.text.trim()
    ..desc = ctx.state.descController.text.trim()
    ..uri = ctx.state.uriController.text.trim();

  Navigator.of(ctx.context).pop<RTState>(
    rt
  );
}


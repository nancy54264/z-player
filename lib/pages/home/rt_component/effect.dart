import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<RTState> buildEffect() {
  return combineEffects(<Object, Effect<RTState>>{
    RTAction.onRemove: _onRemove,
    RTAction.onTop: _onTop,
    RTAction.onEdit: _onEdit,
    RTAction.onAdd: _onAdd,
    RTAction.onPlayer:_onPlayer
  });
}


void _onRemove(Action action, Context<RTState> ctx) async{
  /// TODO 确认操作
  int i = await ctx.state.delete();
  if(i>0){
    ctx.dispatch(RTActionCreator.removeAction(action.payload));
  }
}

void _onTop(Action action, Context<RTState> ctx) async{
  RTState rt = ctx.state.clone();

  await rt.top();

  ctx.dispatch(RTActionCreator.topAction(action.payload));
}

void _onEdit(Action action, Context<RTState> ctx){
  /// TODO 这里需要确认 then 后的含义？
  /// Then 在跳转页面 pop 后调用
  if(action.payload == ctx.state.id){
    Navigator.of(ctx.context)
        .pushNamed("rt_edit", arguments: ctx.state)
        .then((dynamic rt) async{
          if(rt == null) return;
          RTState state = rt;
          state = await state.update();
          ctx.dispatch(RTActionCreator.editAction(state));
    });
  }
}


void _onAdd(Action action, Context<RTState> ctx){
  Navigator.of(ctx.context)
      .pushNamed("rt_edit", arguments: null)
      .then((dynamic rt) async{
        if(rt != null){
          RTState state = rt;
          state = await state.insert();
          ctx.dispatch(RTActionCreator.addAction(state));
        }
  });


}

void _onPlayer(Action action, Context<RTState> ctx){
  Navigator.of(ctx.context).pushNamed("player", arguments: ctx.state);
}




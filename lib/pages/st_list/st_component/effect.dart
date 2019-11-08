import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' show Navigator;
import 'action.dart';
import 'state.dart';

Effect<STState> buildEffect() {
  return combineEffects(<Object, Effect<STState>>{
    STAction.onRemove: _onRemove,
    STAction.onTop: _onTop,
    STAction.onEdit: _onEdit,
    STAction.onAdd: _onAdd,
    STAction.onClick: _onClick
  });
}

void _onRemove(Action action, Context<STState> ctx) async{
  /// TODO 确认操作
  int i = await ctx.state.delete();
  if(i>0){
    ctx.dispatch(STActionCreator.removeAction(action.payload));
  }
}

void _onTop(Action action, Context<STState> ctx) async{
  STState st = ctx.state.clone();

  await st.top();

  ctx.dispatch(STActionCreator.topAction(action.payload));
}

void _onEdit(Action action, Context<STState> ctx){
  /// TODO 这里需要确认 then 后的含义？
  /// Then 在跳转页面 pop 后调用
  if(action.payload == ctx.state.id){
    Navigator.of(ctx.context)
        .pushNamed("st_edit", arguments: ctx.state)
        .then((dynamic rt) async{
          if(rt == null) return;
          STState state = rt;
          state = await state.update();
          ctx.dispatch(STActionCreator.editAction(state));
    });
  }
}


void _onAdd(Action action, Context<STState> ctx){
  Navigator.of(ctx.context)
      .pushNamed("st_edit", arguments: null)
      .then((dynamic rt) async{
    if(rt != null){
      STState state = rt;
      state = await state.insert();
      ctx.dispatch(STActionCreator.addAction(state));
    }
  });

}


void _onClick(Action action, Context<STState> ctx){
  Navigator.of(ctx.context).pushNamed("src_home", arguments: ctx.state);
}

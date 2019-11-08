import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<DrawerState> buildEffect() {
  return combineEffects(<Object, Effect<DrawerState>>{
    DrawerAction.action: _onAction,
    DrawerAction.navTo: _navTo
  });
}

void _onAction(Action action, Context<DrawerState> ctx) {
}

void _navTo(Action action, Context<DrawerState> ctx){
  /// 侧边栏跳转导航
  print("Nav to -> page ${action.payload} !");
  Navigator.of(ctx.context).pushNamed(action.payload);
}

